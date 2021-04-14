# copyright: 2021, Urs Voegele

title "check ansible installation"

# check standard user
control "ansible-1.0" do                    # A unique ID for this control
  impact 1.0                                # The criticality, if this control fails.
  title "check if ansible is installed"     # A human-readable title
  desc "check ansible"
  describe packages(/ansible/) do           # The actual test
    its('statuses') { should cmp 'installed' } 
  end
end
