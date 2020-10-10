using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChoThueXe.Data.Repositories
{
    public interface Itbl_phatsinhxeRepository : IRepository<tbl_phatsinhxe>
    {
    }
    public class tbl_phatsinhxeRepository : RepositoryBase<tbl_phatsinhxe>, Itbl_phatsinhxeRepository
    {
        public tbl_phatsinhxeRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }

       
    }
}
