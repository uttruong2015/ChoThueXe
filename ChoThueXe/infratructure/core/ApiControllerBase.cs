
using ChoThueXe.Model;
using ChoThueXe.Service;
using System;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ChoThueXe.Web.infratructure.core
{
    public class ApiControllerBase : ApiController
    {
        private ILoiService _loiService;
        public ApiControllerBase(ILoiService loiService)
        {
            this._loiService = loiService;
        }
        protected HttpResponseMessage CreateHttpResponse(HttpRequestMessage resquestMessage, Func<HttpResponseMessage> function)
        {
            HttpResponseMessage response = null;
            try
            {
                response = function.Invoke();
            }
            catch(DbUpdateException dbex)
            {
                logError(dbex);
                response = resquestMessage.CreateResponse(HttpStatusCode.BadRequest, dbex.InnerException.Message);
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    Trace.WriteLine($"Entity of type \"{eve.Entry.Entity.GetType().Name}\" in state \"{eve.Entry.State}\" has the following validation error.");
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Trace.WriteLine($"- Property: \"{ve.PropertyName}\", Error: \"{ve.ErrorMessage}\"");
                    }
                }
                logError(ex);
                response = resquestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.InnerException.Message);
            }
            catch (Exception ex)
            {
                logError(ex);
                response = resquestMessage.CreateResponse(HttpStatusCode.BadRequest, ex.Message);

            }
            return response;
        }
         private void logError(Exception ex)
        {
            try
            {
                Loi error = new Loi();
                error.NgayGio = DateTime.Now;
                error.ThongBao = ex.Message;
                error.GhiChu = ex.StackTrace;
                _loiService.Create(error);
                _loiService.Save();
            }
            catch
            {

            }
        }
    }
}
