require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'https://mirrors.tuna.tsinghua.edu.cn/gnu/binutils/binutils-2.27.tar.bz2'
  mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.bz2'
  sha256 '369737ce51587f92466041a97ab7d2358c6d9e1b6490b3940eb09fb0a9a6ac88'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-7'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-7'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-7'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-7'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-elf','--disable-werror',
                             '--enable-gold=yes', '--enable-interwork', '--enable-multilib',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
