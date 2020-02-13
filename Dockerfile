FROM ruby:2.3.3

WORKDIR /app

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50 \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update  \
 && apt-get install -y nodejs yarn \
 && apt-get install -y texlive-base texlive-latex-base texlive-fonts-recommended texlive-math-extra texlive-pstricks texlive-science texlive-lang-portuguese texlive-lang-french \
 && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock /app/

RUN bundle install

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]