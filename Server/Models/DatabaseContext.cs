using BlazorApp.DBFirst.Shared.Models;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp.DBFirst.Server.Models
{
    public partial class DatabaseContext : DbContext
    {
        public DatabaseContext()
        {
        }
        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
        }
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<Blog> Blogs { get; set; } = null!;
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("userdetails");
                entity.Property(e => e.Userid).HasColumnName("Userid");
                entity.Property(e => e.Username)
                    .HasMaxLength(100)
                    .IsUnicode(false);
                entity.Property(e => e.Address)
                    .HasMaxLength(500)
                    .IsUnicode(false);
                entity.Property(e => e.Cellnumber)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.Emailid)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Blog>(entity =>
            {
                entity.ToTable("post");
                entity.Property(e => e.Blogid).HasColumnName("Blogid");
                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .IsUnicode(false);
                entity.Property(e => e.CreationDate)                    
                    .IsUnicode(false);
                entity.Property(e => e.PostBody)
                    .HasMaxLength(1000)
                    .IsUnicode(false);
                entity.Property(e => e.PublishedDate)                    
                    .IsUnicode(false);
                entity.Property(e => e.Status)
                    .IsUnicode(false);
                entity.Property(e => e.IsDeleted)
                    .IsUnicode(false);
            });


            OnModelCreatingPartial(modelBuilder);
        }




        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }

}