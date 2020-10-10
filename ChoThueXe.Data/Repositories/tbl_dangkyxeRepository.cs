using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_dangkyxeRepository : IRepository<tbl_dangkyxe>
    {
    }
    public class tbl_dangkyxeRepository : RepositoryBase<tbl_dangkyxe>, Itbl_dangkyxeRepository
    {
        public tbl_dangkyxeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
