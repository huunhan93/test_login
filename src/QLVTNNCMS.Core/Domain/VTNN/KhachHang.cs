using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QLVTNNCMS.Core.Domain.VTNN
{
    [Table("KhachHang")]
    [Index(nameof(MaKH), IsUnique = true)]
    public class KhachHang
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [Column(TypeName = "varchar(10)")]
        public required string MaKH { get; set; }

        [Column(TypeName = "nvarchar(256)")]
        public string TenKH { get; set; }

        public DateTime? NgaySinh { get; set; }

        [Column(TypeName = "nvarchar(500)")]
        public string DiaChi { get; set; }

        [Required]
        [Column(TypeName = "varchar(15)")]
        public string SDT { get; set; }

        public float TongTienDaMua { get; set; }
        public float CongNoPhaiThu { get; set; }
        public float CongNoPhaiTra { get; set; }
        public bool LaNCC { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime? DateModified { get; set; }
    }
}
