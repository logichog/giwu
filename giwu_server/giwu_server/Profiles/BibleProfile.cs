using AutoMapper;
using giwu_server.Models;
using giwu_server.ViewModels;

namespace giwu_server.Profiles
{
    public class BibleProfile : Profile
    {
        public BibleProfile() {
            /*
            CreateMap<Verses, VersesViewModel>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.id))
                .ForMember(dest => dest.book, opt => opt.MapFrom(src => src.b))
                .ForMember(dest => dest.FName, opt => opt.MapFrom(src => src.c))
                .ForMember(dest => dest.FName, opt => opt.MapFrom(src => src.v))
                .ForMember(dest => dest.LName, opt => opt.MapFrom(src => src.y));
            */
            CreateMap<Verses, VersesViewModel>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.id))
                .ForMember(dest => dest.Verse, opt => opt.MapFrom(src => src.b))
                .ForMember(dest => dest.Text, opt => opt.MapFrom(src => src.t));
        }
    }
}
