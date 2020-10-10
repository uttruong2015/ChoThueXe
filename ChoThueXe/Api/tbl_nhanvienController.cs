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
    [RoutePrefix("api/nhanvien")]
    [Authorize]
    public class tbl_nhanvienController : ApiControllerBase
    {
        Itbl_nhanvienService _tbl_nhanvienService;

        public tbl_nhanvienController(ILoiService loiService, Itbl_nhanvienService tbl_nhanvienService) : base(loiService)
        {
            this._tbl_nhanvienService = tbl_nhanvienService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_nhanvienViewModel khachHang)
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
                    var newThongBao = new tbl_nhanvien();
                    newThongBao.Updatetbl_nhanvien(khachHang);

                    _tbl_nhanvienService.Add(newThongBao);
                    _tbl_nhanvienService.Save();
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
                var listtbl_nhanvientegory = _tbl_nhanvienService.GetAll();
                //var responseData = Mapper.Map<IEnumerable<tbl_nhanvien>,IEnumerable<tbl_nhanvienViewModel>>(listtbl_nhanvientegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listtbl_nhanvientegory);
                return response;
            });
        }
        [Route("laymacuoicung")]
        [HttpGet]
        public HttpResponseMessage laymacuoicung(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_nhanvientegory = _tbl_nhanvienService.GetAll().OrderByDescending(x=>x.Manv).FirstOrDefault();
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listtbl_nhanvientegory);
                return response;
            });
        }



        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_nhanvientegory = _tbl_nhanvienService.GetByID(Convert.ToInt32(id));
                var responseData = Mapper.Map<tbl_nhanvien,tbl_nhanvienViewModel>(listtbl_nhanvientegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_nhanvienViewModel tbl_nhanvienVm)

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
                    var chucvu = _tbl_nhanvienService.GetByID(tbl_nhanvienVm.Manv);
                    chucvu.Updatetbl_nhanvien(tbl_nhanvienVm);
                    _tbl_nhanvienService.Update(chucvu);
                    _tbl_nhanvienService.Commit();
                    
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
                    _tbl_nhanvienService.delete(ID);
                    _tbl_nhanvienService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

    }
}
