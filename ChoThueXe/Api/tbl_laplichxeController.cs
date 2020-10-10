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
    [RoutePrefix("api/laplichxe")]
    [Authorize]
    public class tbl_laplichxeController : ApiControllerBase
    {
        Itbl_laplichxeService _tbl_laplichxeService;

        public tbl_laplichxeController(ILoiService loiService, Itbl_laplichxeService tbl_laplichxeService) : base(loiService)
        {
            this._tbl_laplichxeService = tbl_laplichxeService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request,IEnumerable< IEnumerable<tbl_laplichxeViewModel>> khachHang)
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
                    foreach (var item in khachHang)
                    {
                        foreach (var i in item)
                        {
                            _tbl_laplichxeService.xoatruockhithem(i.Sttxe, i.Ngaydukien);
                        }
                    }
                    foreach (var item in khachHang)
                    {
                        foreach (var i in item)
                        {
                            
                            var newThongBao = new tbl_laplichxe();
                            newThongBao.Updatetbl_laplichxe(i);

                            _tbl_laplichxeService.Add(newThongBao);
                            _tbl_laplichxeService.Save();
                        }
                    }
                    
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
                var listtbl_laplichxetegory = _tbl_laplichxeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_laplichxe>,IEnumerable<tbl_laplichxeViewModel>>(listtbl_laplichxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request, string manv, string sttxe, DateTime ngaydukien, byte tugio)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_laplichxetegory = _tbl_laplichxeService.GetByID( manv,  sttxe,  ngaydukien,  tugio);
                var responseData = Mapper.Map<tbl_laplichxe,tbl_laplichxeViewModel>(listtbl_laplichxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_laplichxeViewModel tbl_laplichxeVm)

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
                    var chucvu = _tbl_laplichxeService.GetByID(tbl_laplichxeVm.Manv,tbl_laplichxeVm.Sttxe,tbl_laplichxeVm.Ngaydukien,tbl_laplichxeVm.Tugio);
                    chucvu.Updatetbl_laplichxe(tbl_laplichxeVm);
                    _tbl_laplichxeService.Update(chucvu);
                    _tbl_laplichxeService.Commit();
                    
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
                    _tbl_laplichxeService.delete(int.Parse(ID));
                    _tbl_laplichxeService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }
        [Route("laylichtheongay")]
        [HttpGet]
        public HttpResponseMessage kiemtralichxe(HttpRequestMessage request, DateTime ngaydukien)
        {
            return CreateHttpResponse(request, () =>
            {
                string datetest = ngaydukien.ToShortDateString();
                var listtbl_laplichxetegory = _tbl_laplichxeService.laylichtheongay(ngaydukien);
                
                var responseData = Mapper.Map<IEnumerable<tbl_laplichxe>, IEnumerable<tbl_laplichxeViewModel>>(listtbl_laplichxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

    }
}
