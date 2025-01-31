﻿using System;
using System.Collections.Generic;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Persistence.Contexts;

public partial class BuyRentHomeDbContext : DbContext
{
    public BuyRentHomeDbContext()
    {
    }

    public BuyRentHomeDbContext(DbContextOptions<BuyRentHomeDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<ChatMessage> ChatMessages { get; set; }

    public virtual DbSet<CitiesAreaManager> CitiesAreaManagers { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<FurnishingType> FurnishingTypes { get; set; }

    public virtual DbSet<Photo> Photos { get; set; }

    public virtual DbSet<Property> Properties { get; set; }

    public virtual DbSet<PropertyType> PropertyTypes { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserPrivilege> UserPrivileges { get; set; }

    public virtual DbSet<VisitingRequest> VisitingRequests { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=Default");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("SQL_Latin1_General_CP1_CI_AS");

        modelBuilder.Entity<ChatMessage>(entity =>
        {
            entity.Property(e => e.Message).IsUnicode(false);

            entity.HasOne(d => d.Receiver).WithMany(p => p.ChatMessageReceivers)
                .HasForeignKey(d => d.ReceiverId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChatMessages_ReceiverId_Users_Id");

            entity.HasOne(d => d.Sender).WithMany(p => p.ChatMessageSenders)
                .HasForeignKey(d => d.SenderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChatMessages_SenderId_Users_Id");
        });

        modelBuilder.Entity<CitiesAreaManager>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.LastUpdatedOn).HasDefaultValueSql("(getdate())");

            entity.HasOne(d => d.City).WithMany(p => p.CitiesAreaManagers)
                .HasForeignKey(d => d.CityId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CitiesAreaManagersCityId_CitiesId");

            entity.HasOne(d => d.LastUpdatedByNavigation).WithMany(p => p.CitiesAreaManagerLastUpdatedByNavigations)
                .HasForeignKey(d => d.LastUpdatedBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CitiesAreaManagersLastUpdatedBy_UsersId");

            entity.HasOne(d => d.Manager).WithMany(p => p.CitiesAreaManagerManagers)
                .HasForeignKey(d => d.ManagerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CitiesAreaManagersManagerId_UsersId");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasIndex(e => e.CountryId, "IX_Cities_CountryId");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.AreaInKm).HasColumnName("AreaInKM");
            entity.Property(e => e.LastUpdatedBy).HasDefaultValue(0);
            entity.Property(e => e.LastUpdatedOn).HasDefaultValueSql("(getdate())");

            entity.HasOne(d => d.Country).WithMany(p => p.Cities)
                .HasForeignKey(d => d.CountryId)
                .OnDelete(DeleteBehavior.ClientSetNull);
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasIndex(e => e.LastUpdatedBy, "IX_Countries_LastUpdatedBy");

            entity.Property(e => e.LastUpdatedOn).HasDefaultValueSql("(getdate())");

            entity.HasOne(d => d.LastUpdatedByNavigation).WithMany(p => p.Countries)
                .HasForeignKey(d => d.LastUpdatedBy)
                .HasConstraintName("FK_Countries_Users");
        });

        modelBuilder.Entity<Photo>(entity =>
        {
            entity.HasIndex(e => e.LastUpdatedBy, "IX_Photos_LastUpdatedBy");

            entity.HasIndex(e => e.PropertyId, "IX_Photos_PropertyId");

            entity.HasOne(d => d.LastUpdatedByNavigation).WithMany(p => p.Photos)
                .HasForeignKey(d => d.LastUpdatedBy)
                .OnDelete(DeleteBehavior.ClientSetNull);

            entity.HasOne(d => d.Property).WithMany(p => p.Photos).HasForeignKey(d => d.PropertyId);
        });

        modelBuilder.Entity<Property>(entity =>
        {
            entity.HasIndex(e => e.CityId, "IX_Properties_CityId");

            entity.HasIndex(e => e.CountryId, "IX_Properties_CountryId");

            entity.HasIndex(e => e.FurnishingTypeId, "IX_Properties_FurnishingTypeId");

            entity.HasIndex(e => e.PostedBy, "IX_Properties_PostedBy");

            entity.HasIndex(e => e.PropertyTypeId, "IX_Properties_PropertyTypeId");

            entity.Property(e => e.AvailableDays)
                .HasMaxLength(60)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength()
                .HasComment("A: Active,\r\nD: Draft,\r\nC: Complete");

            entity.HasOne(d => d.City).WithMany(p => p.Properties)
                .HasForeignKey(d => d.CityId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            entity.HasOne(d => d.Country).WithMany(p => p.Properties)
                .HasForeignKey(d => d.CountryId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            entity.HasOne(d => d.FurnishingType).WithMany(p => p.Properties).HasForeignKey(d => d.FurnishingTypeId);

            entity.HasOne(d => d.PostedByNavigation).WithMany(p => p.Properties).HasForeignKey(d => d.PostedBy);

            entity.HasOne(d => d.PropertyType).WithMany(p => p.Properties).HasForeignKey(d => d.PropertyTypeId);
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasIndex(e => e.CreatedBy, "IX_Roles_CreatedBy");

            entity.HasIndex(e => e.UpdatedBy, "IX_Roles_UpdatedBy");

            entity.Property(e => e.CreatedAt).HasColumnType("datetime");
            entity.Property(e => e.Description).HasMaxLength(200);
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.UpdatedAt).HasColumnType("datetime");

            entity.HasOne(d => d.CreatedByNavigation).WithMany(p => p.RoleCreatedByNavigations)
                .HasForeignKey(d => d.CreatedBy)
                .OnDelete(DeleteBehavior.ClientSetNull);

            entity.HasOne(d => d.UpdatedByNavigation).WithMany(p => p.RoleUpdatedByNavigations)
                .HasForeignKey(d => d.UpdatedBy)
                .OnDelete(DeleteBehavior.ClientSetNull);
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasIndex(e => e.Username, "UK_Users_Username").IsUnique();

            entity.Property(e => e.Email).HasMaxLength(255);
            entity.Property(e => e.Username).HasMaxLength(255);
        });

        modelBuilder.Entity<UserPrivilege>(entity =>
        {
            entity.HasIndex(e => e.RoleId, "IX_UserPrivileges_RoleId");

            entity.HasIndex(e => e.UserId, "IX_UserPrivileges_UserId");

            entity.HasOne(d => d.Role).WithMany(p => p.UserPrivileges)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.ClientSetNull);

            entity.HasOne(d => d.User).WithMany(p => p.UserPrivileges)
                .HasForeignKey(d => d.UserId)
                .OnDelete(DeleteBehavior.ClientSetNull);
        });

        modelBuilder.Entity<VisitingRequest>(entity =>
        {
            entity.Property(e => e.ContactNumber)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.EndTime).HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.StartTime)
                .HasColumnType("datetime")
                .HasColumnName("StartTIme");
            entity.Property(e => e.Status)
                .HasMaxLength(1)
                .IsUnicode(false)
                .HasDefaultValue("N")
                .IsFixedLength()
                .HasComment("P: Pending; A: Approved; N: Not Approved");

            entity.HasOne(d => d.Property).WithMany(p => p.VisitingRequests)
                .HasForeignKey(d => d.PropertyId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_VisitingRequests_Properties");

            entity.HasOne(d => d.TakenByNavigation).WithMany(p => p.VisitingRequests)
                .HasForeignKey(d => d.TakenBy)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_VisitingRequests_Users");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
