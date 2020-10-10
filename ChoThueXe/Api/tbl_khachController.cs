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
using System.Web.Script.Serialization;

namespace ChoThueXe.Web.Api
{
    [RoutePrefix("api/khach")]
    [Authorize]
    public class tbl_khachController : ApiControllerBase
    {
        Itbl_khachService _tbl_khachService;

        public tbl_khachController(ILoiService loiService, Itbl_khachService tbl_khachService) : base(loiService)
        {
            this._tbl_khachService = tbl_khachService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_khachViewModel khachHang)
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
                    var newThongBao = new tbl_khach();
                    newThongBao.Updatetbl_khach(khachHang);

                    _tbl_khachService.Add(newThongBao);
                    _tbl_khachService.Save();
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
                var listtbl_khachtegory = _tbl_khachService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_khach>,IEnumerable<tbl_khachViewModel>>(listtbl_khachtegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_khachtegory = _tbl_khachService.GetByID(id);
                var responseData = Mapper.Map<tbl_khach,tbl_khachViewModel>(listtbl_khachtegory);
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
                var model = _tbl_khachService.GetAll(filter);

                totalRow = model.Count();
                var query = model.OrderBy(x => x.Maso).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<tbl_khach>, IEnumerable<tbl_khachViewModel>>(query);

                var paginationSet = new PaginationSet<tbl_khachViewModel>()
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


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_khachViewModel tbl_khachVm)

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
                    var chucvu = _tbl_khachService.GetByID(tbl_khachVm.Maso);
                    chucvu.Updatetbl_khach(tbl_khachVm);
                    _tbl_khachService.Update(chucvu);
                    _tbl_khachService.Commit();
                    
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
                    _tbl_khachService.delete(ID);
                    _tbl_khachService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }
        [Route("deletemulti")]
        [HttpDelete]
        public HttpResponseMessage DeleteMulti(HttpRequestMessage request, string selected)
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
                    var list = new JavaScriptSerializer().Deserialize<List<string>>(selected);
                    foreach (var item in list)
                    {
                        _tbl_khachService.delete(item);
                    }

                    _tbl_khachService.Save();

                    response = request.CreateResponse(HttpStatusCode.OK, list.Count);
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
                var listtbl_xe = _tbl_khachService.GetAll().OrderByDescending(x => x.Maso).FirstOrDefault();
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listtbl_xe);
                return response;
            });
        }
    }
}
