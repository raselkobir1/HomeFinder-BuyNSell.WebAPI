﻿namespace Domain.Interfaces.Data;

public interface IUnitOfWork : IDisposable
{
    ICityRepository CityRepository { get; }
    IUserRepository UserRepository { get; }
    IPropertyRepository PropertyRepository { get; }
    IPropertyTypeRepository PropertyTypeRepository { get; }
    IFurnishingTypeRepository FurnishingTypeRepository { get; }
    ICountryRepository CountryRepository { get; }
    IPhotoRepository PhotoRepository { get; }
    IUserPrivilegeRepository UserPrivilegeRepository { get; }
    IRoleRepository RoleRepository { get; }
    ICitiesAreaManagerRepository CitiesAreaManagerRepository { get; }
    IVisitingRequestRepository VisitingRequestRepository { get; }
    Task<bool> SaveAsync();
}
