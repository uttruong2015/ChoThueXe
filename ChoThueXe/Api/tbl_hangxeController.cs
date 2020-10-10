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
    [RoutePrefix("api/hangxe")]
    [Authorize]
    public class tbl_hangxeController : ApiControllerBase
    {
        Itbl_hangxeService _tbl_hangxeService;
        Itbl_xeService _tbl_xeService;

        public tbl_hangxeController(ILoiService loiService, Itbl_hangxeService tbl_hangxeService, Itbl_xeService tbl_xeService) : base(loiService)
        {
            this._tbl_hangxeService = tbl_hangxeService;
            this._tbl_xeService = tbl_xeService;
        }
        [Route("create")]
        [HttpPost]
        public HttpResponseMessage Create(HttpRequestMessage request, tbl_hangxeViewModel khachHang)
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
                    var newThongBao = new tbl_hangxe();
                    newThongBao.Updatetbl_hangxe(khachHang);

                    _tbl_hangxeService.Add(newThongBao);
                    _tbl_hangxeService.Save();
                    response = request.CreateResponse(HttpStatusCode.OK);
                }
                return response;
            });
        }

        [Route("getlistpaging")]
        public HttpResponseMessage getlistpaging(HttpRequestMessage request, int page, int pageSize = 20, string filter = null)
        {
            return CreateHttpResponse(request, () =>
            {
                int totalRow = 0;
                var model = _tbl_hangxeService.GetAll(filter);

                totalRow = model.Count();
                var query = model.OrderBy(x => x.Mahangxe).Skip(page * pageSize).Take(pageSize);

                var responseData = Mapper.Map<IEnumerable<tbl_hangxe>, IEnumerable<tbl_hangxeViewModel>>(query);

                var paginationSet = new PaginationSet<tbl_hangxeViewModel>()
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
        [Route("getall")]
        public HttpResponseMessage Get(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var model = _tbl_hangxeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_hangxe>, IEnumerable<tbl_hangxeViewModel>>(model);
                var response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }

        [Route("getbyid")]
        public HttpResponseMessage getbyid(HttpRequestMessage request,string id)
        {
            return CreateHttpResponse(request, () =>
            {
                var listtbl_hangxetegory = _tbl_hangxeService.GetByID(id);
                var responseData = Mapper.Map<tbl_hangxe,tbl_hangxeViewModel>(listtbl_hangxetegory);
                HttpResponseMessage response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }


        [Route("update")]
        [HttpPut]
        public HttpResponseMessage update(HttpRequestMessage request, tbl_hangxeViewModel tbl_hangxeVm)

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
                    var chucvu = _tbl_hangxeService.GetByID(tbl_hangxeVm.Mahangxe);
                    chucvu.Updatetbl_hangxe(tbl_hangxeVm);
                    _tbl_hangxeService.Update(chucvu);
                    _tbl_hangxeService.Commit();
                    
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
                    _tbl_hangxeService.delete(ID);
                    _tbl_hangxeService.Save();
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
                        _tbl_hangxeService.delete(item);
                    }

                    _tbl_hangxeService.Save();

                    response = request.CreateResponse(HttpStatusCode.OK, list.Count);
                }

                return response;
            });
        }
        [Route("gophangxevaxe")]
        [HttpGet]
        public HttpResponseMessage gophangxevaxe(HttpRequestMessage request)
        {
            return CreateHttpResponse(request, () =>
            {
                var model = _tbl_hangxeService.GetAll();
                var responseData = Mapper.Map<IEnumerable<tbl_hangxe>, IEnumerable<gopHangXeVaXe>>(model);
                foreach (var item in responseData)
                {
                    var getxe = _tbl_xeService.GetByHangXe(item.Mahangxe);
                    item.xe= Mapper.Map<IEnumerable<tbl_xe>, IEnumerable<tbl_xeViewModel>>(getxe);
                }
                var response = request.CreateResponse(HttpStatusCode.OK, responseData);
                return response;
            });
        }
    }
}
