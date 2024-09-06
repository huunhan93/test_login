using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLVTNNCMS.Core.Domain.VTNN
{
    [Table("NhomMatHang")]
    public class NhomMatHang
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Column(TypeName = "nvarchar(256)")]
        public string TenNhomHang { get; set; }

        public bool? HoatDong { get; set; }
    }
}
