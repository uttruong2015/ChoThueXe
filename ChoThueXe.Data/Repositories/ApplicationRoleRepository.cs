using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ChoThueXe.Data.Infrastructure;
using ChoThueXe.Model.Models;

namespace ChoThueXe.Data.Repositories
{
    public interface IApplicationRoleRepository : IRepository<ApplicationRole>
    {
        IEnumerable<ApplicationRole> GetListRoleByGroupId(int groupId);
        IEnumerable<ApplicationRole> GetListRoleByUserId(string userId);
    }
    public class ApplicationRoleRepository : RepositoryBase<ApplicationRole>, IApplicationRoleRepository
    {
        public ApplicationRoleRepository(IDbFactory dbFactory) : base(dbFactory)
        {

        }
        public IEnumerable<ApplicationRole> GetListRoleByGroupId(int groupId)
        {
            var query = from g in DbContext.ApplicationRoles
                        join ug in DbContext.ApplicationRoleGroups
                        on g.Id equals ug.RoleId
                        where ug.GroupId == groupId
                        select g;
            return query;
        }

        public IEnumerable<ApplicationRole> GetListRoleByUserId(string userId)
        {
            var query = from a in DbContext.ApplicationUserGroups
                        join  u in DbContext.ApplicationGroups
                        on a.GroupId equals u.ID
                        join ug in DbContext.ApplicationRoleGroups
                        on u.ID equals ug.GroupId
                        join r in DbContext.ApplicationRoles
                        on ug.RoleId equals r.Id
                        where a.UserId == userId
                        select r;
            return query;
        }
    }
}
