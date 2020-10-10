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
    [RoutePrefix("api/dangkyxe")]
    [Authorize]
    public class tbl_dangkyxeController : ApiControllerBase
    {
        Itbl_dangkyxeService _tbl_dangkyxeService;

        public tbl_dangkyxeController(ILoiService loiService, Itbl_dangkyxeService tbl_dangkyxeService) : base(loiService)
        {
            this._tbl_dangkyxeService = tbl_dangkyxeService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_dangkyxeViewModel khachHang)
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
                    var newThongBao = new tbl_dangkyxe();
                    newThongBao.Updatetbl_dangkyxe(khachHang);

                    _tbl_dangkyxeService.Add(newThongBao);
                    _tbl_dangkyxeService.Save();
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
                var listtbl_dangkyxetegory = _tbl_dangkyxeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_dangkyxe>,IEnumerable<tbl_dangkyxeViewModel>>(listtbl_dangkyxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request, string sttphieu, string sttxe, DateTime ngaysd, byte tugio)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_dangkyxetegory = _tbl_dangkyxeService.GetByID( sttphieu,  sttxe,  ngaysd,  tugio);
                var responseData = Mapper.Map<tbl_dangkyxe,tbl_dangkyxeViewModel>(listtbl_dangkyxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_dangkyxeViewModel tbl_dangkyxeVm)

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
                    var chucvu = _tbl_dangkyxeService.GetByID(tbl_dangkyxeVm.Sttphieu,tbl_dangkyxeVm.Sttxe,tbl_dangkyxeVm.Ngaysd,tbl_dangkyxeVm.Tugio);
                    var map = Mapper.Map<tbl_dangkyxe, tbl_dangkyxeViewModel>(chucvu);
                    chucvu.Updatetbl_dangkyxe(tbl_dangkyxeVm);
                    _tbl_dangkyxeService.Update(chucvu);
                    _tbl_dangkyxeService.Commit();
                    
                    response = request.CreateResponse(HttpStatusCode.OK);

                }
                return response;
            });
        }
        [Route("delete")]
        [HttpDelete]
        public HttpResponseMessage Delete(HttpRequestMessage request, string sttphieu, string sttxe, DateTime ngaysd, byte tugio)
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
                    var del = _tbl_dangkyxeService.GetByID(sttphieu, sttxe, ngaysd, tugio);
                    _tbl_dangkyxeService.delete(del);
                    _tbl_dangkyxeService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

    }
}
