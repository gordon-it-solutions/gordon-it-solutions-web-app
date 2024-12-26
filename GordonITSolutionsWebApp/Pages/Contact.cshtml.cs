using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using GordonITSolutionsWebApp.Data;
using GordonITSolutionsWebApp.Models;

namespace GordonITSolutionsWebApp.Pages
{
    public class ContactModel : PageModel
    {
        private readonly ApplicationDbContext _context;

        public ContactModel(ApplicationDbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ContactUsFormModel? Form { get; set; }

        public string? SuccessMessage { get; set; }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                if (Form != null)
                {
                    // Save form data to the database
                    _context.ContactFormEntries.Add(Form);
                    await _context.SaveChangesAsync();

                    // Set success message
                    SuccessMessage = "Thank you for getting in touch! We will get back to you soon.";
                }
                else
                {
                    // Handle the case where the form is unexpectedly null
                    ModelState.AddModelError(string.Empty, "The form submission failed. Please try again.");
                }

                return Page();
            }
            return Page();
        }
    }
}

