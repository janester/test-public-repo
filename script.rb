require 'git'
require 'pry-byebug'

g = Git.open('/Users/janester/Documents/code/dev-repos/test-public-repo/')

10.times do |commit_count|
  puts "making directories..."
  `mkdir test_files`
  `mkdir test_files/lorem_ipsum_dolor_sit_amet_consectetur_adipiscing_elit_aliquam_ultricies_accumsan_velit_vitae_scelerisque_ex_egestas_in_proin_pellentesque_felis_ac_tellus_gravida_ut_viverra_purus_feugiat_pellentesque_habitant_morbi_tristique_senectus_et_netus_et_malesuad`

  puts "making files..."
  3000.times do |file_count|
    `touch test_files/lorem_ipsum_dolor_sit_amet_consectetur_adipiscing_elit_aliquam_ultricies_accumsan_velit_vitae_scelerisque_ex_egestas_in_proin_pellentesque_felis_ac_tellus_gravida_ut_viverra_purus_feugiat_pellentesque_habitant_morbi_tristique_senectus_#{file_count}.txt`
  end

  binding.pry
  puts "adding files to git..."
  `git add . > /dev/null`

  puts "committing files to git..."
  #`git commit -m adding_files_#{commit_count}`
  g.commit("adding files #{commit_count}")

  puts "removing all of the files..."
  `rm -rf test_files/`

  puts "adding files to git..."
  `git add . > /dev/null`

  puts "committing files to git..."
  `git commit -m "removing files #{commit_count}`
end
