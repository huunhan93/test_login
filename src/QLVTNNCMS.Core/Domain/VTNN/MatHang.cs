using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLVTNNCMS.Core.Domain.VTNN
{
    [Table("MatHang")]
    public class MatHang
    {
        [Key]
        public int Id { get; set; }

        public int NhomId { get; set; }

        [Required]
        [Column(TypeName = "nvarchar(256)")]
        public string TenMatHang { get; set; }

        public string Mota { get; set; }
        public float GiaNhap { get; set; }
        public float GiaBan { get; set; }
        
        public string GhiChu { get; set; }

        [Column(TypeName = "varchar(10)")]
        public string DonViChinh { get; set; }
        public string? DonViPhu { get; set; }
        public int TyLeChuyenDoi { get; set; }
        public string HinhAnh { get; set; }
    }
}
