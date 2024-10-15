﻿using Application.DTOs;

namespace Application.Interfaces;

public interface ICityService
{
    Task<List<CityDto>> GetCityListByCountry(int countryId);
}
