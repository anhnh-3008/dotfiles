#!/bin/bash

# --- BẢNG MÀU THÔNG BÁO ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' 

echo -e "${BLUE}==============================================${NC}"
echo -e "${BLUE}   BẮT ĐẦU SETUP TERMINAL "VŨ KHÍ TỐI THƯỢNG"   ${NC}"
echo -e "${BLUE}==============================================${NC}"

# 1. THIẾT LẬP THEME ĐEN CHO APPLE TERMINAL
echo -e "${YELLOW}1. Đang cấu hình Terminal mặc định sang giao diện Dark (Pro)...${NC}"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
echo -e "${GREEN}✔ Đã chuyển sang profile 'Pro'.${NC}"

# 2. KIỂM TRA HOMEBREW
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}2. Đang cài đặt Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}✔ Homebrew đã có sẵn.${NC}"
fi

# 3. CÀI ĐẶT CÔNG CỤ CLI HIỆN ĐẠI & FONT
echo -e "${YELLOW}3. Đang cài đặt eza, bat, fzf, zoxide, btop và Nerd Font...${NC}"
brew install eza bat fzf zoxide btop --quiet
brew install --cask font-jetbrains-mono-nerd-font --quiet
echo -e "${GREEN}✔ Đã cài đặt xong các công cụ bổ trợ.${NC}"

# 4. CÀI ĐẶT OH MY ZSH
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}4. Đang cài đặt Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}✔ Oh My Zsh đã có sẵn.${NC}"
fi

# Định nghĩa đường dẫn
ZSH_CUSTOM_PLUGINS="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
ZSH_CUSTOM_THEMES="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"

# 5. CÀI ĐẶT PLUGINS & THEME POWERLEVEL10K
echo -e "${YELLOW}5. Đang tải Plugins và Theme P10k...${NC}"

# zsh-autosuggestions
[ ! -d "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions" ] && \
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM_PLUGINS/zsh-autosuggestions"

# zsh-syntax-highlighting
[ ! -d "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting" ] && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM_PLUGINS/zsh-syntax-highlighting"

# Powerlevel10k theme
[ ! -d "$ZSH_CUSTOM_THEMES/powerlevel10k" ] && \
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM_THEMES/powerlevel10k"

# 6. CẤU HÌNH FILE .ZSHRC
echo -e "${YELLOW}6. Đang tối ưu hóa file .zshrc...${NC}"
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.bak

# Thay đổi Theme và Plugins bằng sed
sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
# Thay thế dòng plugins=(git) bằng danh sách đầy đủ
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide fzf)/g' ~/.zshrc

# Thêm Alias và cấu hình màu sắc vào cuối file nếu chưa có
if ! grep -q "Modern CLI Aliases" ~/.zshrc; then
cat <<EOT >> ~/.zshrc

# --- Modern CLI Aliases ---
alias ls="eza --icons --group-directories-first"
alias ll="eza -l --icons --git"
alias cat="bat"
alias htop="btop"

# --- Zsh Settings ---
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
eval "\$(zoxide init zsh)"
EOT
fi

echo -e "${BLUE}==============================================${NC}"
echo -e "${GREEN}        HOÀN TẤT CÀI ĐẶT THÀNH CÔNG!          ${NC}"
echo -e "${BLUE}==============================================${NC}"
echo -e "${YELLOW}CÁC BƯỚC CUỐI CÙNG:${NC}"
echo -e "1. Chạy lệnh: ${BLUE}source ~/.zshrc${NC}"
echo -e "2. Làm theo hướng dẫn của Powerlevel10k để chọn kiểu giao diện."
echo -e "3. Vào Settings Terminal -> Text -> Font: Chọn ${BLUE}'JetBrainsMono Nerd Font'${NC}."
echo -e "${BLUE}==============================================${NC}"
