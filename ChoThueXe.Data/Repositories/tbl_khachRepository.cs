using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_khachRepository : IRepository<tbl_khach>
    {
    }
    public class tbl_khachRepository : RepositoryBase<tbl_khach>, Itbl_khachRepository
    {
        public tbl_khachRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
