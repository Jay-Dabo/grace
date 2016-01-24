module ChurchesHelper
  def denominations
    {
      Catholic: "Catholic",
      Baptist: "Baptist",
      Methodist: "Methodist",
      Lutheran: "Lutheran",
      Presbyterian: "Presbyterian",
      Protestant: "Protestant",
      Pentecostal: "Pentecostal",
      Episcopalian: "Episcopalian",
      Mormon: "Mormon",
      "Chruch of Christ".to_sym => "Chruch of Christ",
      Nondenominational: "Nondenominational",
      Congregational: "Congregational",
      "Jehovah's Witness".to_sym => "Jehovah's Witness",
      "Assemblies of God".to_sym => "Assemblies of God",
      Evangelical: "Evangelical",
      "Church of God".to_sym => "Church of God",
      "Seventh-Day Adventist".to_sym => "Seventh-Day Adventist",
      Orthodox: "Orthodox",
      Holiness: "Holiness",
      "Church of the Nazarene".to_sym => "Church of the Nazarene",
      "Disciples of Christ".to_sym => "Disciples of Christ",
      "Church of the Brethren".to_sym => "Church of the Brethren", 
      Mennonite: "Mennonite"
    }
  end
end
