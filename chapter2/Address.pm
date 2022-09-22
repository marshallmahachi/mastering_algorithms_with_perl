package Address;

my @fields = qw(name street city country);

sub new {

    my ($class, $data) = @_;

    return undef unless ref $data eq 'HASH';

    my $self;

    for my $field (@fields) {

        return undef unless exists $data->{$field};

        $self->{$field} = $data->{$field};
    }

    return bless $self, $class;
}

sub country {

    my ($self, $new_data);

    if (defined $new_data && ref $new_data eq '') {
        $self->{country} = $new_data;
    }

    return $self->{country};
}

sub as_string {

    my ($self) = @_;

    my $address_string = '';

    for my $field (@fields) {

        $address_string .= $self->{$field} . "\n" if defined $self->{$field};
    }

    return $address_string;
}

1;
