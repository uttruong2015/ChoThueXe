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
    [RoutePrefix("api/phatsinhxe")]
    [Authorize]
    public class tbl_phatsinhxeController : ApiControllerBase
    {
        Itbl_phatsinhxeService _tbl_phatsinhxeService;

        public tbl_phatsinhxeController(ILoiService loiService, Itbl_phatsinhxeService tbl_phatsinhxeService) : base(loiService)
        {
            this._tbl_phatsinhxeService = tbl_phatsinhxeService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_phatsinhxeViewModel khachHang)
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
                    var newThongBao = new tbl_phatsinhxe();
                    newThongBao.Updatetbl_phatsinhxe(khachHang);

                    _tbl_phatsinhxeService.Add(newThongBao);
                    _tbl_phatsinhxeService.Save();
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
                var listtbl_phatsinhxetegory = _tbl_phatsinhxeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_phatsinhxe>,IEnumerable<tbl_phatsinhxeViewModel>>(listtbl_phatsinhxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_phatsinhxetegory = _tbl_phatsinhxeService.GetByID(Convert.ToInt32(id));
                var responseData = Mapper.Map<tbl_phatsinhxe,tbl_phatsinhxeViewModel>(listtbl_phatsinhxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_phatsinhxeViewModel tbl_phatsinhxeVm)

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
                    var chucvu = _tbl_phatsinhxeService.GetByID(Convert.ToInt32(tbl_phatsinhxeVm.Sttps));
                    chucvu.Updatetbl_phatsinhxe(tbl_phatsinhxeVm);
                    _tbl_phatsinhxeService.Update(chucvu);
                    _tbl_phatsinhxeService.Commit();
                    
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
                    _tbl_phatsinhxeService.delete(int.Parse(ID));
                    _tbl_phatsinhxeService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

    }
}
