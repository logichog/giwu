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

            CreateMap<BibleVerseKey, BibleViewModel>()
                .ForMember(dest => dest.Table, opt => opt.MapFrom(src => src.table))
                .ForMember(dest => dest.Abbreviation, opt => opt.MapFrom(src => src.abbreviation))
                .ForMember(dest => dest.Language, opt => opt.MapFrom(src => src.language))
                .ForMember(dest => dest.Version, opt => opt.MapFrom(src => src.version))
                .ForMember(dest => dest.InfoText, opt => opt.MapFrom(src => src.info_text))
                .ForMember(dest => dest.InfoUrl, opt => opt.MapFrom(src => src.info_text))
                .ForMember(dest => dest.Publisher, opt => opt.MapFrom(src => src.publisher))
                .ForMember(dest => dest.Copyright, opt => opt.MapFrom(src => src.copyright))
                .ForMember(dest => dest.CopyrightInfo, opt => opt.MapFrom(src => src.copyright_info));

            CreateMap<Verses, VersesViewModel>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.id))
                .ForMember(dest => dest.Verse, opt => opt.MapFrom(src => src.b))
                .ForMember(dest => dest.Text, opt => opt.MapFrom(src => src.t));
        }
    }
}
