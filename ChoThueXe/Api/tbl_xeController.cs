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
    [RoutePrefix("api/xe")]
    [Authorize]
    public class tbl_xeController : ApiControllerBase
    {
        Itbl_xeService _tbl_xeService;

        public tbl_xeController(ILoiService loiService, Itbl_xeService tbl_xeService) : base(loiService)
        {
            this._tbl_xeService = tbl_xeService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_xeViewModel khachHang)
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
                    var newThongBao = new tbl_xe();
                    newThongBao.Updatetbl_xe(khachHang);

                    _tbl_xeService.Add(newThongBao);
                    _tbl_xeService.Save();
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
                var model = _tbl_xeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_xe>, IEnumerable<tbl_xeViewModel>>(model);
                var response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }
         [Route("getlistpaging")]
        public HttpResponseMessage getlistpaging(HttpRequestMessage request, int page, int pageSize = 20, string filter = null)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _tbl_xeService.GetAll(filter);

                totalRow = model.Count();
                var query = model.OrderBy(x => x.Sttxe).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<tbl_xe>, IEnumerable<tbl_xeViewModel>>(query);

                var paginationSet = new PaginationSet<tbl_xeViewModel>()
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
                var listtbl_xetegory = _tbl_xeService.GetByID(id);
                var responseData = Mapper.Map<tbl_xe,tbl_xeViewModel>(listtbl_xetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_xeViewModel tbl_xeVm)

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
                    var chucvu = _tbl_xeService.GetByID(tbl_xeVm.Sttxe);
                    chucvu.Updatetbl_xe(tbl_xeVm);
                    _tbl_xeService.Update(chucvu);
                    _tbl_xeService.Commit();
                    
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
                    _tbl_xeService.delete(ID);
                    _tbl_xeService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }

                return response;
            });
        }

        [Route("deletemulti")]
        [HttpDelete]
        public HttpResponseMessage DeleteMulti(HttpRequestMessage request, string selectedProducts)
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
                    var listProductCategory = new JavaScriptSerializer().Deserialize<List<string>>(selectedProducts);
                    foreach (var item in listProductCategory)
                    {
                        _tbl_xeService.delete(item);
                    }

                    _tbl_xeService.Save();

                    response = request.CreateResponse(HttpStatusCode.OK, listProductCategory.Count);
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
                var listtbl_xe = _tbl_xeService.GetAll().OrderByDescending(x => x.Sttxe).FirstOrDefault();
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, listtbl_xe);
                return response;
            });
        }

    }
}
