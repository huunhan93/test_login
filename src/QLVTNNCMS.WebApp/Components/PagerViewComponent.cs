using Microsoft.AspNetCore.Mvc;
using QLVTNNCMS.Core.Models;

namespace QLVTNNCMS.WebApp.Components
{
    public class PagerViewComponent : ViewComponent
    {
        public Task<IViewComponentResult> InvokeAsync(PagedResultBase result)
        {
            return Task.FromResult((IViewComponentResult)View("Default", result));
        }
    }
}
