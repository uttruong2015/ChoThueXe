using ChoThueXe.Model;
using System;

namespace ChoThueXe.Data.Infrastructure
{
    public interface IDbFactory : IDisposable
    {
        QL_thuexeEntities Init();
    }
   
}