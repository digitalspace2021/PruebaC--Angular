using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Prueba_Seguro.Data;
using Prueba_Seguro.Models;

namespace Prueba_Seguro.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        private readonly ValueRepository _repositorio;

        public ValuesController(ValueRepository repositorio)
        {

            _repositorio = repositorio ?? throw new ArgumentNullException(nameof(repositorio));
        }


        // GET api/values
        [HttpGet]
        public async Task<ActionResult<List<Cliente>>> Get()
        {
            var response = await _repositorio.Getcliente(" ");
            if (response == null) { return NotFound(); }

            return response;
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public async Task < ActionResult< List<Cliente>>> Get(string id)
        {
            var response = await _repositorio.Getcliente(id);
            if (response == null) { return NotFound(); }
          
            return response;
        }

      
    }
}
