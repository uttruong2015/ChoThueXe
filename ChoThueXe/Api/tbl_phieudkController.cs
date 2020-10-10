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
    [RoutePrefix("api/phieudk")]
    [Authorize]
    public class tbl_phieudkController : ApiControllerBase
    {
        Itbl_phieudkService _tbl_phieudkService;

        public tbl_phieudkController(ILoiService loiService, Itbl_phieudkService tbl_phieudkService) : base(loiService)
        {
            this._tbl_phieudkService = tbl_phieudkService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_phieudkViewModel khachHang)
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
                    var newThongBao = new tbl_phieudk();
                    newThongBao.Updatetbl_phieudk(khachHang);

                    _tbl_phieudkService.Add(newThongBao);
                    _tbl_phieudkService.Save();
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
                var listtbl_phieudktegory = _tbl_phieudkService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_phieudk>,IEnumerable<tbl_phieudkViewModel>>(listtbl_phieudktegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }
        [Route("getlistpaging")]
        public HttpResponseMessage getlistpaging(HttpRequestMessage request, int page, int pageSize = 20, string filter = null)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _tbl_phieudkService.layPhieuDangKy();
                if (!string.IsNullOrEmpty(filter))
                {
                    model = model.Where(x=>x.Sttphieu.Contains(filter)||x.Manv.Contains(filter)||x.Hoten.Contains(filter)||x.Maso.Contains(filter)||x.Hotenkhach.Contains(filter)||x.Mahangxe.Contains(filter));
                };

                totalRow = model.Count();
                var query = model.OrderBy(x => x.Mahangxe).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<layPhieuDangKy>>(query);

                var paginationSet = new PaginationSet<layPhieuDangKy>()
                {
                    Items = responseData,
                    Page = page,
                    TotalCount = totalRow,
                    TotalPages = (int)Math.Ceiling((decimal)totalRow / pageSize)
                };
                var response = request.CreateResponse(HttpStatusCode.OK, paginationSet);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_phieudktegory = _tbl_phieudkService.GetByID(id);
                var responseData = Mapper.Map<tbl_phieudk,tbl_phieudkViewModel>(listtbl_phieudktegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_phieudkViewModel tbl_phieudkVm)

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
                    var chucvu = _tbl_phieudkService.GetByID(tbl_phieudkVm.Sttphieu);
                    chucvu.Updatetbl_phieudk(tbl_phieudkVm);
                    _tbl_phieudkService.Update(chucvu);
                    _tbl_phieudkService.Commit();
                    
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
                    _tbl_phieudkService.delete(ID);
                    _tbl_phieudkService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }
        [Route("laymacuoicung")]
        [HttpGet]
        public HttpResponseMessage laymacuoicung(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_xe = _tbl_phieudkService.GetAll().OrderByDescending(x => x.Sttphieu).FirstOrDefault();
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listtbl_xe);
                return response;
            });
        }
    }
}
