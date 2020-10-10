using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_hangxeRepository : IRepository<tbl_hangxe>
    {
    }
    public class tbl_hangxeRepository : RepositoryBase<tbl_hangxe>, Itbl_hangxeRepository
    {
        public tbl_hangxeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
