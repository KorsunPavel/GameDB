//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleApp1
{
    using System;
    using System.Collections.Generic;
    
    public partial class TblComment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TblComment()
        {
            this.ChildComments = new HashSet<TblComment>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Body { get; set; }
        public Nullable<int> Game_Id { get; set; }
        public Nullable<int> ParentCommentId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TblComment> ChildComments { get; set; }
        public virtual TblComment ParentComment { get; set; }
        public virtual TblGame TblGame { get; set; }
    }
}