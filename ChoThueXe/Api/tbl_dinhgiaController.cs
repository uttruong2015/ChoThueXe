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
    [RoutePrefix("api/dinhgia")]
    [Authorize]
    public class tbl_dinhgiaController : ApiControllerBase
    {
        Itbl_dinhgiaService _tbl_dinhgiaService;

        public tbl_dinhgiaController(ILoiService loiService, Itbl_dinhgiaService tbl_dinhgiaService) : base(loiService)
        {
            this._tbl_dinhgiaService = tbl_dinhgiaService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_dinhgiaViewModel khachHang)
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
                    var newThongBao = new tbl_dinhgia();
                    newThongBao.Updatetbl_dinhgia(khachHang);

                    _tbl_dinhgiaService.Add(newThongBao);
                    _tbl_dinhgiaService.Save();
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
                var listtbl_dinhgiategory = _tbl_dinhgiaService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_dinhgia>,IEnumerable<tbl_dinhgiaViewModel>>(listtbl_dinhgiategory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request, string mahangxe, string manv, short thang, short nam)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_dinhgiategory = _tbl_dinhgiaService.GetByID( mahangxe,  manv,  thang,  nam);
                var responseData = Mapper.Map<tbl_dinhgia,tbl_dinhgiaViewModel>(listtbl_dinhgiategory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_dinhgiaViewModel tbl_dinhgiaVm)

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
                    var chucvu = _tbl_dinhgiaService.GetByID(tbl_dinhgiaVm.Mahangxe, tbl_dinhgiaVm.Manv, tbl_dinhgiaVm.Thang, tbl_dinhgiaVm.Nam);
                    chucvu.Updatetbl_dinhgia(tbl_dinhgiaVm);
                    _tbl_dinhgiaService.Update(chucvu);
                    _tbl_dinhgiaService.Commit();
                    
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
                    _tbl_dinhgiaService.delete(int.Parse(ID));
                    _tbl_dinhgiaService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

    }
}
