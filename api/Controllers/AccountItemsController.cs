using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Account.Models;

namespace api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountItemsController : ControllerBase
    {
        private readonly AccountContext _context;

        public AccountItemsController(AccountContext context)
        {
            _context = context;
        }

        // GET: api/AccountItems
        [HttpGet]
        public async Task<ActionResult<IEnumerable<AccountItem>>> GetAccountItems()
        {
            return await _context.AccountItems.ToListAsync();
        }

        // GET: api/AccountItems/5
        [HttpGet("{id}")]
        public async Task<ActionResult<AccountItem>> GetAccountItem(long id)
        {
            var accountItem = await _context.AccountItems.FindAsync(id);

            if (accountItem == null)
            {
                return NotFound();
            }

            return accountItem;
        }

        // PUT: api/AccountItems/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutAccountItem(long id, AccountItem accountItem)
        {
            if (id != accountItem.Id)
            {
                return BadRequest();
            }

            _context.Entry(accountItem).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!AccountItemExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/AccountItems
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<AccountItem>> PostAccountItem(AccountItem accountItem)
        {
            _context.AccountItems.Add(accountItem);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetAccountItem", new { id = accountItem.Id }, accountItem);
        }

        // DELETE: api/AccountItems/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<AccountItem>> DeleteAccountItem(long id)
        {
            var accountItem = await _context.AccountItems.FindAsync(id);
            if (accountItem == null)
            {
                return NotFound();
            }

            _context.AccountItems.Remove(accountItem);
            await _context.SaveChangesAsync();

            return accountItem;
        }

        private bool AccountItemExists(long id)
        {
            return _context.AccountItems.Any(e => e.Id == id);
        }
    }
}
