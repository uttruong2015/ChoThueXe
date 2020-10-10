using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_chucvuRepository : IRepository<tbl_chucvu>
    {
    }
    public class tbl_chucvuRepository : RepositoryBase<tbl_chucvu>, Itbl_chucvuRepository
    {
        public tbl_chucvuRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
