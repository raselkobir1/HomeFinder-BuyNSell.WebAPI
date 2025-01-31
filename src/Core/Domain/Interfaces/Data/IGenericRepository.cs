﻿using Domain.Common;
using System.Linq.Expressions;

namespace Domain.Interfaces.Data;

public interface IGenericRepository<T> where T : class
{
    Task<IList<T>> GetAll(Expression<Func<T, bool>> expression = null,
                        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
                        List<string> includes = null);
    Task<IList<T>> GetAll(Expression<Func<T, bool>> expression = null, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, params Expression<Func<T, object>>[] includes);

    Task<PageResult<T>> GetPaginateList(
        int pageNo = 1, int pageSize = 10,
        Expression<Func<T, bool>> filter = null,
        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
        params Expression<Func<T, object>>[] includes
        );
    Task<T> Get(Expression<Func<T, bool>> expression, List<string> includes = null);
    Task<T> Get(Expression<Func<T, bool>> expression, params Expression<Func<T, object>>[] includes);
    Task Insert(T entity);
    Task InsertRange(IEnumerable<T> entities);
    void Update(T entity);
    void UpdateRange(IEnumerable<T> entities);
    Task Delete(int id);
    Task DeleteRange(IEnumerable<T> entities);
}
