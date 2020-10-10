using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_xeRepository : IRepository<tbl_xe>
    {
    }
    public class tbl_xeRepository : RepositoryBase<tbl_xe>, Itbl_xeRepository
    {
        public tbl_xeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
