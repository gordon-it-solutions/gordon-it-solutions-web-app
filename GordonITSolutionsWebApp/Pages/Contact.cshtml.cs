using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GordonITSolutionsWebApp.Pages
{
    public class ContactModel : PageModel
    {
        [BindProperty]
        public ContactUsFormModel? Form { get; set; }

        public string? SuccessMessage { get; set; }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (ModelState.IsValid)
            {
                // Process the form data (e.g., send an email or store in a database)
                // For now, we’ll just simulate a successful submission
                SuccessMessage = "Thank you for getting in touch! We will get back to you soon.";
                return Page();
            }
            return Page();
        }
    }

    public class ContactUsFormModel
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Message { get; set; }
    }
}


