using AutoMapper;
using Newtonsoft.Json.Linq;
using ChoThueXe.Model;
using ChoThueXe.Service;
using ChoThueXe.Web.infratructure.core;
using ChoThueXe.Web.infratructure.extensions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ChoThueXe.Web.Infrastructure.Core;
using ChoThueXe.Models;

namespace ChoThueXe.Web.Api
{
    [RoutePrefix("api/chucvu")]
    [Authorize]
    public class tbl_chucvuController : ApiControllerBase
    {
        Itbl_chucvuService _tbl_chucvuService;

        public tbl_chucvuController(ILoiService loiService, Itbl_chucvuService tbl_chucvuService) : base(loiService)
        {
            this._tbl_chucvuService = tbl_chucvuService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_chucvuViewModel khachHang)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    var newThongBao = new tbl_chucvu();
                    newThongBao.Updatetbl_chucvu(khachHang);

                    _tbl_chucvuService.Add(newThongBao);
                    _tbl_chucvuService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }

        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_chucvutegory = _tbl_chucvuService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_chucvu>,IEnumerable<tbl_chucvuViewModel>>(listtbl_chucvutegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_chucvutegory = _tbl_chucvuService.GetByID(Convert.ToInt32(id));
                var responseData = Mapper.Map<tbl_chucvu,tbl_chucvuViewModel>(listtbl_chucvutegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_chucvuViewModel tbl_chucvuVm)

        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    var chucvu = _tbl_chucvuService.GetByID(Convert.ToInt32(tbl_chucvuVm.Macv));
                    chucvu.Updatetbl_chucvu(tbl_chucvuVm);
                    _tbl_chucvuService.Update(chucvu);
                    _tbl_chucvuService.Commit();
                    
                    response = request.CreateResponse(HttpStatusCode.OK);

                }
                return response;
            });
        }
        [Route("delete")]
        [HttpDelete]
        public HttpResponseMessage Delete(HttpRequestMessage request, string ID)
        {
            return CreateHttpResponse(request, () =>
            {
                HttpResponseMessage response = null;
                if (!ModelState.IsValid)
                {
                    response = request.CreateResponse(HttpStatusCode.BadRequest, ModelState);
                }
                else
                {
                    _tbl_chucvuService.delete(int.Parse(ID));
                    _tbl_chucvuService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

    }
}
