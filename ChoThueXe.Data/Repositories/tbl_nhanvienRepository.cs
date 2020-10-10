using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_nhanvienRepository : IRepository<tbl_nhanvien>
    {
    }
    public class tbl_nhanvienRepository : RepositoryBase<tbl_nhanvien>, Itbl_nhanvienRepository
    {
        public tbl_nhanvienRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
