﻿using API.WebSocketHandlers;
using System.Net;
using System.Net.WebSockets;

namespace BuyAndRentHomeWebAPI.Middlewares
{
    public class WebSocketMiddleware
    {
        private readonly RequestDelegate next;
        private readonly IChatWebSocketHandler chatWebSocketHandler;

        public WebSocketMiddleware(RequestDelegate _next, IChatWebSocketHandler chatWebSocketHandler)
        {
            next = _next;
            this.chatWebSocketHandler = chatWebSocketHandler;
        }

        public async Task Invoke(HttpContext context)
        {
            if (context.WebSockets.IsWebSocketRequest)
            {
                if (context.User.Identity is not null && context.User.Identity.IsAuthenticated)
                {
                    if (context.Request.Path == "/chat")
                    {
                        WebSocket webSocket = await context.WebSockets.AcceptWebSocketAsync();
                        await chatWebSocketHandler.HandleWebSocketConnection(webSocket, context);
                    }
                    else
                    {
                        context.Response.StatusCode = (int)HttpStatusCode.NotFound;
                        return;
                    }
                }
                else
                {
                    context.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                    return;
                }
            }
            else
            {
                await next(context);
            }
        }
    }

    public static class WebSocketMiddlewareExtensions
    {
        public static IApplicationBuilder UseWebSocketMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<WebSocketMiddleware>();
        }
    }
}
