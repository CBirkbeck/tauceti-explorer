# PKG-ArithmeticStatistics — completed package

Author: Codex, session `codex-wjdPkG`, 17 October 2026. Refs #10115. The claim was confirmed by the swarm bot on claim comment 6231999907. This is the package author's handoff, not an independent review.

The deliverables are `packages/ArithmeticStatistics/README.md`, `Suggested.lean` and `metadata.toml`, plus this note. The package is complete for independent review. No packet, assembled reader, atlas data, another package, or upstream checkout was edited. There is no unfinished implementation or checkpoint to resume.

The README retains the mathematical content of all 711 accepted targets, including their hypotheses, source locators, API items, acceptance checks and definition tests. It uses six layers in dependency order, topic prose, explicit support targets, Examples and Dependencies. Of the 711 inputs, 709 have individual target paragraphs, one weight definition is merged into its Layer 0 owner with both statements/APIs/checks retained, and the native permutation-action predicate is deferred to Scope. A target here is a formalization plan, not a claim that its proof has been formalized. Conjectures and conditional estimates remain explicit propositions or implications.

The suggested file is deliberately representative: 513 lines, real-bodied light definitions on available carriers, theorem signatures and examples. It does not introduce sorry-defined data. All README definitions/interfaces are represented by declarations or named in its closing comment. Heavy arithmetic carriers, constructions and end theorems remain in the README with full contracts.

## Inputs and conservation

Read the accepted core packet, the six accepted stage refinements, the assembled reader and its suggested file, and ASM-ArithmeticStatistics. The core contributes 415 targets, refinements 40+33+51+76+41+55=296. Original-layer totals are 77,90,103,109,83,249. The final individual-paragraph totals are 89,84,102,156,103,175. The layer shifts make the finite statistical tools precede their arithmetic consumers. The 119 gap records and 143 supplier requests are indexed below against their consumers; no absence of a proof in an input was silently turned into a proof.

The packets contain 167 definition/construction targets, 176 targets with API lists, 1,097 API entries and 612 explicit unit-test entries. Every definition/construction has at least three discriminating tests; acceptance checks additionally cover the theorem targets. Repeated identical statement/acceptance text is rendered once. The finished README has 676 Checks blocks and 130 source/edition references. Multiple editions are kept separate where their numbering differs.

The following conservation inventory is exhaustive. The original IDs are only navigation keys in this handoff; they are absent from the roadmap prose.

| Accepted target | Final location | Disposition |
|---|---|---|

| `ArithmeticStatistics:ST.0/arithmetic-family` | [§0.1 arithmetic family](../packages/ArithmeticStatistics/README.md#arithmetic-family) | retained |

| `ArithmeticStatistics:ST.0/relative-density` | [§0.1 relative density](../packages/ArithmeticStatistics/README.md#relative-density) | retained |

| `ArithmeticStatistics:ST.0/relative-density-is-multiplicative-in-towers` | [§0.1 relative density is multiplicative in towers](../packages/ArithmeticStatistics/README.md#relative-density-is-multiplicative-in-towers) | retained |

| `ArithmeticStatistics:ST.0/density-one-restricts-to-subfamilies-of-positive-lower-density` | [§0.1 density one restricts to subfamilies of positive lower density](../packages/ArithmeticStatistics/README.md#density-one-restricts-to-subfamilies-of-positive-lower-density) | retained |

| `ArithmeticStatistics:ST.0/constant-rescaling-of-a-height` | [§0.1 constant rescaling of a height](../packages/ArithmeticStatistics/README.md#constant-rescaling-of-a-height) | retained |

| `ArithmeticStatistics:ST.0/piecewise-rescaling-of-a-height` | [§0.1 piecewise rescaling of a height](../packages/ArithmeticStatistics/README.md#piecewise-rescaling-of-a-height) | retained |

| `ArithmeticStatistics:ST.0/stabilizer-weighted-orbit-count` | [§0.1 stabilizer weighted orbit count](../packages/ArithmeticStatistics/README.md#stabilizer-weighted-orbit-count) | retained |

| `ArithmeticStatistics:ST.0/weighted-and-unweighted-orbit-counts` | [§0.1 weighted and unweighted orbit counts](../packages/ArithmeticStatistics/README.md#weighted-and-unweighted-orbit-counts) | retained |

| `ArithmeticStatistics:ST.0/family-defined-by-local-conditions` | [§0.2 family defined by local conditions](../packages/ArithmeticStatistics/README.md#family-defined-by-local-conditions) | retained |

| `ArithmeticStatistics:ST.0/acceptable-weight-function` | [§0.2 acceptable weight function](../packages/ArithmeticStatistics/README.md#acceptable-weight-function) | retained |

| `ArithmeticStatistics:ST.0/binary-quartic-form` | [§0.3 binary quartic form](../packages/ArithmeticStatistics/README.md#binary-quartic-form) | retained |

| `ArithmeticStatistics:ST.0/binary-quartic-invariants` | [§0.3 binary quartic invariants](../packages/ArithmeticStatistics/README.md#binary-quartic-invariants) | retained |

| `ArithmeticStatistics:ST.0/relative-invariance-of-i-and-j` | [§0.3 relative invariance of i and j](../packages/ArithmeticStatistics/README.md#relative-invariance-of-i-and-j) | retained |

| `ArithmeticStatistics:ST.0/quartic-discriminant-is-the-polynomial-discriminant` | [§0.3 quartic discriminant is the polynomial discriminant](../packages/ArithmeticStatistics/README.md#quartic-discriminant-is-the-polynomial-discriminant) | retained |

| `ArithmeticStatistics:ST.0/binary-quartic-height` | [§0.3 binary quartic height](../packages/ArithmeticStatistics/README.md#binary-quartic-height) | retained |

| `ArithmeticStatistics:ST.0/eligible-invariant-pairs` | [§0.3 eligible invariant pairs](../packages/ArithmeticStatistics/README.md#eligible-invariant-pairs) | retained |

| `ArithmeticStatistics:ST.0/eligible-invariant-pairs-satisfy-the-congruences` | [§0.3 eligible invariant pairs satisfy the congruences](../packages/ArithmeticStatistics/README.md#eligible-invariant-pairs-satisfy-the-congruences) | retained |

| `ArithmeticStatistics:ST.0/congruence-pairs-are-eligible` | [§0.3 congruence pairs are eligible](../packages/ArithmeticStatistics/README.md#congruence-pairs-are-eligible) | retained |

| `ArithmeticStatistics:ST.0/eligibility-criterion-modulo-27` | [§0.3 eligibility criterion modulo 27](../packages/ArithmeticStatistics/README.md#eligibility-criterion-modulo-27) | retained |

| `ArithmeticStatistics:ST.0/eligible-pairs-are-nine-lattice-translates` | [§0.3 eligible pairs are nine lattice translates](../packages/ArithmeticStatistics/README.md#eligible-pairs-are-nine-lattice-translates) | retained |

| `ArithmeticStatistics:ST.0/elliptic-curves-over-q-ordered-by-height` | [§0.4 elliptic curves over q ordered by height](../packages/ArithmeticStatistics/README.md#elliptic-curves-over-q-ordered-by-height) | retained |

| `ArithmeticStatistics:ST.0/quartic-to-curve-height-normalisation` | [§0.4 quartic to curve height normalisation](../packages/ArithmeticStatistics/README.md#quartic-to-curve-height-normalisation) | retained |

| `ArithmeticStatistics:ST.0/elliptic-families-defined-by-congruence-conditions` | [§0.4 elliptic families defined by congruence conditions](../packages/ArithmeticStatistics/README.md#elliptic-families-defined-by-congruence-conditions) | retained |

| `ArithmeticStatistics:ST.0/all-elliptic-curves-form-a-large-family` | [§0.4 all elliptic curves form a large family](../packages/ArithmeticStatistics/README.md#all-elliptic-curves-form-a-large-family) | retained |

| `ArithmeticStatistics:ST.0/invariants-height-and-eligible-pairs` | [§0.4 invariants height and eligible pairs](../packages/ArithmeticStatistics/README.md#invariants-height-and-eligible-pairs) | retained |

| `ArithmeticStatistics:ST.0/squareclass-height` | [§0.5 squareclass height](../packages/ArithmeticStatistics/README.md#squareclass-height) | retained |

| `ArithmeticStatistics:ST.0/squareclass-height-fibres-are-selmer-cosets` | [§0.5 squareclass height fibres are selmer cosets](../packages/ArithmeticStatistics/README.md#squareclass-height-fibres-are-selmer-cosets) | retained |

| `ArithmeticStatistics:ST.0/finiteness-of-squareclasses-of-bounded-height` | [§0.5 finiteness of squareclasses of bounded height](../packages/ArithmeticStatistics/README.md#finiteness-of-squareclasses-of-bounded-height) | retained |

| `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family` | [§0.5 quadratic twist squareclass family](../packages/ArithmeticStatistics/README.md#quadratic-twist-squareclass-family) | retained |

| `ArithmeticStatistics:ST.0/isomorphism-multiplicity-of-the-twist-family` | [§0.5 isomorphism multiplicity of the twist family](../packages/ArithmeticStatistics/README.md#isomorphism-multiplicity-of-the-twist-family) | retained |

| `ArithmeticStatistics:ST.0/positive-squarefree-family-over-q` | [§0.6 positive squarefree family over q](../packages/ArithmeticStatistics/README.md#positive-squarefree-family-over-q) | retained |

| `ArithmeticStatistics:ST.0/squarefree-indicator-as-a-moebius-sum` | [§0.6 squarefree indicator as a moebius sum](../packages/ArithmeticStatistics/README.md#squarefree-indicator-as-a-moebius-sum) | retained |

| `ArithmeticStatistics:ST.0/squarefree-integers-in-residue-classes` | [§0.6 squarefree integers in residue classes](../packages/ArithmeticStatistics/README.md#squarefree-integers-in-residue-classes) | retained |

| `ArithmeticStatistics:ST.0/even-parity-classes-have-half-density` | [§0.6 even parity classes have half density](../packages/ArithmeticStatistics/README.md#even-parity-classes-have-half-density) | retained |

| `ArithmeticStatistics:ST.0/density-one-in-the-even-parity-classes-is-half-of-all-squarefree` | [§0.6 density one in the even parity classes is half of all squarefree](../packages/ArithmeticStatistics/README.md#density-one-in-the-even-parity-classes-is-half-of-all-squarefree) | retained |

| `ArithmeticStatistics:ST.0/number-fields-ordered-by-discriminant` | [§0.7 number fields ordered by discriminant](../packages/ArithmeticStatistics/README.md#number-fields-ordered-by-discriminant) | retained |

| `ArithmeticStatistics:ST.0/embedded-and-isomorphism-class-counts-of-number-fields` | [§0.7 embedded and isomorphism class counts of number fields](../packages/ArithmeticStatistics/README.md#embedded-and-isomorphism-class-counts-of-number-fields) | retained |

| `ArithmeticStatistics:ST.1/binary-cubic-forms-and-the-twisted-action` | [§0.8 binary cubic forms and the twisted action](../packages/ArithmeticStatistics/README.md#binary-cubic-forms-and-the-twisted-action) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/cubic-ring` | [§0.8 cubic ring](../packages/ArithmeticStatistics/README.md#cubic-ring) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/quotient-by-scalars-is-free` | [§1.1 quotient by scalars is free](../packages/ArithmeticStatistics/README.md#quotient-by-scalars-is-free) | retained |

| `ArithmeticStatistics:ST.1/cubic-ring-of-a-binary-cubic-form` | [§0.8 cubic ring of a binary cubic form](../packages/ArithmeticStatistics/README.md#cubic-ring-of-a-binary-cubic-form) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/discriminant-of-the-cubic-ring-of-a-form` | [§0.8 discriminant of the cubic ring of a form](../packages/ArithmeticStatistics/README.md#discriminant-of-the-cubic-ring-of-a-form) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/index-form-of-a-based-cubic-ring` | [§1.1 index form of a based cubic ring](../packages/ArithmeticStatistics/README.md#index-form-of-a-based-cubic-ring) | retained |

| `ArithmeticStatistics:ST.1/normal-bases-of-a-cubic-ring` | [§1.1 normal bases of a cubic ring](../packages/ArithmeticStatistics/README.md#normal-bases-of-a-cubic-ring) | retained |

| `ArithmeticStatistics:ST.1/delone-faddeev-parametrization-of-cubic-rings` | [§1.1 delone faddeev parametrization of cubic rings](../packages/ArithmeticStatistics/README.md#delone-faddeev-parametrization-of-cubic-rings) | retained |

| `ArithmeticStatistics:ST.1/automorphisms-of-cubic-rings-are-stabilizers` | [§1.1 automorphisms of cubic rings are stabilizers](../packages/ArithmeticStatistics/README.md#automorphisms-of-cubic-rings-are-stabilizers) | retained |

| `ArithmeticStatistics:ST.1/reducible-forms-and-zero-divisors` | [§1.1 reducible forms and zero divisors](../packages/ArithmeticStatistics/README.md#reducible-forms-and-zero-divisors) | retained |

| `ArithmeticStatistics:ST.1/nondegenerate-forms-and-etale-cubic-algebras` | [§1.1 nondegenerate forms and etale cubic algebras](../packages/ArithmeticStatistics/README.md#nondegenerate-forms-and-etale-cubic-algebras) | retained |

| `ArithmeticStatistics:ST.1/davenport-heilbronn-sets` | [§1.2 davenport heilbronn sets](../packages/ArithmeticStatistics/README.md#davenport-heilbronn-sets) | retained |

| `ArithmeticStatistics:ST.1/nonmaximal-cubic-rings-have-small-overrings` | [§1.2 nonmaximal cubic rings have small overrings](../packages/ArithmeticStatistics/README.md#nonmaximal-cubic-rings-have-small-overrings) | retained |

| `ArithmeticStatistics:ST.1/davenport-heilbronn-maximality-criterion` | [§1.2 davenport heilbronn maximality criterion](../packages/ArithmeticStatistics/README.md#davenport-heilbronn-maximality-criterion) | retained |

| `ArithmeticStatistics:ST.1/index-p-subrings-of-a-cubic-ring` | [§1.2 index p subrings of a cubic ring](../packages/ArithmeticStatistics/README.md#index-p-subrings-of-a-cubic-ring) | retained |

| `ArithmeticStatistics:ST.1/index-p-overrings-of-a-cubic-ring` | [§1.2 index p overrings of a cubic ring](../packages/ArithmeticStatistics/README.md#index-p-overrings-of-a-cubic-ring) | retained |

| `ArithmeticStatistics:ST.1/pairs-of-ternary-quadratic-forms` | [§1.3 pairs of ternary quadratic forms](../packages/ArithmeticStatistics/README.md#pairs-of-ternary-quadratic-forms) | retained |

| `ArithmeticStatistics:ST.1/quartic-ring-and-cubic-resolvent` | [§1.3 quartic ring and cubic resolvent](../packages/ArithmeticStatistics/README.md#quartic-ring-and-cubic-resolvent) | retained |

| `ArithmeticStatistics:ST.1/quartic-ring-of-a-pair` | [§1.3 quartic ring of a pair](../packages/ArithmeticStatistics/README.md#quartic-ring-of-a-pair) | retained |

| `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quartic-rings` | [§1.3 bhargava parametrization of quartic rings](../packages/ArithmeticStatistics/README.md#bhargava-parametrization-of-quartic-rings) | retained |

| `ArithmeticStatistics:ST.1/existence-and-number-of-cubic-resolvents` | [§1.3 existence and number of cubic resolvents](../packages/ArithmeticStatistics/README.md#existence-and-number-of-cubic-resolvents) | retained |

| `ArithmeticStatistics:ST.1/maximality-of-quartic-rings-at-p` | [§1.3 maximality of quartic rings at p](../packages/ArithmeticStatistics/README.md#maximality-of-quartic-rings-at-p) | retained |

| `ArithmeticStatistics:ST.1/splitting-types-of-pairs-of-ternary-quadratic-forms` | [§1.3 splitting types of pairs of ternary quadratic forms](../packages/ArithmeticStatistics/README.md#splitting-types-of-pairs-of-ternary-quadratic-forms) | retained |

| `ArithmeticStatistics:ST.1/quadruples-of-quinary-alternating-forms` | [§1.4 quadruples of quinary alternating forms](../packages/ArithmeticStatistics/README.md#quadruples-of-quinary-alternating-forms) | retained |

| `ArithmeticStatistics:ST.1/bhargava-parametrization-of-quintic-rings` | [§1.4 bhargava parametrization of quintic rings](../packages/ArithmeticStatistics/README.md#bhargava-parametrization-of-quintic-rings) | retained |

| `ArithmeticStatistics:ST.1/maximality-of-quintic-rings-at-p` | [§1.4 maximality of quintic rings at p](../packages/ArithmeticStatistics/README.md#maximality-of-quintic-rings-at-p) | retained |

| `ArithmeticStatistics:ST.1/pgl2-orbits-and-stabilizers-of-binary-quartic-forms` | [§1.5 pgl2 orbits and stabilizers of binary quartic forms](../packages/ArithmeticStatistics/README.md#pgl2-orbits-and-stabilizers-of-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.1/soluble-binary-quartic-forms` | [§1.5 soluble binary quartic forms](../packages/ArithmeticStatistics/README.md#soluble-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.1/covariants-of-a-binary-quartic` | [§1.5 covariants of a binary quartic](../packages/ArithmeticStatistics/README.md#covariants-of-a-binary-quartic) | retained |

| `ArithmeticStatistics:ST.1/syzygy-of-binary-quartic-covariants` | [§1.5 syzygy of binary quartic covariants](../packages/ArithmeticStatistics/README.md#syzygy-of-binary-quartic-covariants) | retained |

| `ArithmeticStatistics:ST.1/cubic-invariant-of-a-binary-quartic` | [§1.5 cubic invariant of a binary quartic](../packages/ArithmeticStatistics/README.md#cubic-invariant-of-a-binary-quartic) | retained |

| `ArithmeticStatistics:ST.1/cubic-invariant-is-an-orbit-invariant` | [§1.5 cubic invariant is an orbit invariant](../packages/ArithmeticStatistics/README.md#cubic-invariant-is-an-orbit-invariant) | retained |

| `ArithmeticStatistics:ST.1/linear-factor-forms` | [§1.5 linear factor forms](../packages/ArithmeticStatistics/README.md#linear-factor-forms) | retained |

| `ArithmeticStatistics:ST.1/auxiliary-quartic-root-from-equal-cubic-invariants` | [§1.5 auxiliary quartic root from equal cubic invariants](../packages/ArithmeticStatistics/README.md#auxiliary-quartic-root-from-equal-cubic-invariants) | retained |

| `ArithmeticStatistics:ST.1/linear-factor-of-the-comparison-quartic-gives-equivalence` | [§1.5 linear factor of the comparison quartic gives equivalence](../packages/ArithmeticStatistics/README.md#linear-factor-of-the-comparison-quartic-gives-equivalence) | retained |

| `ArithmeticStatistics:ST.1/cubic-invariant-determines-the-orbit` | [§1.5 cubic invariant determines the orbit](../packages/ArithmeticStatistics/README.md#cubic-invariant-determines-the-orbit) | retained |

| `ArithmeticStatistics:ST.1/quartic-of-a-point` | [§1.6 quartic of a point](../packages/ArithmeticStatistics/README.md#quartic-of-a-point) | retained |

| `ArithmeticStatistics:ST.1/cubic-invariant-of-the-quartic-of-a-point` | [§1.6 cubic invariant of the quartic of a point](../packages/ArithmeticStatistics/README.md#cubic-invariant-of-the-quartic-of-a-point) | retained |

| `ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-e-mod-2e` | [§1.6 binary quartic parametrization of e mod 2e](../packages/ArithmeticStatistics/README.md#binary-quartic-parametrization-of-e-mod-2e) | retained |

| `ArithmeticStatistics:ST.1/bilinear-factor-criterion-for-proper-equivalence` | [§1.6 bilinear factor criterion for proper equivalence](../packages/ArithmeticStatistics/README.md#bilinear-factor-criterion-for-proper-equivalence) | retained |

| `ArithmeticStatistics:ST.1/stabilizer-of-a-binary-quartic-is-two-torsion` | [§1.6 stabilizer of a binary quartic is two torsion](../packages/ArithmeticStatistics/README.md#stabilizer-of-a-binary-quartic-is-two-torsion) | retained |

| `ArithmeticStatistics:ST.1/image-of-the-cubic-invariant` | [§1.6 image of the cubic invariant](../packages/ArithmeticStatistics/README.md#image-of-the-cubic-invariant) | retained |

| `ArithmeticStatistics:ST.1/locally-soluble-quartics-and-the-two-selmer-group` | [§1.6 locally soluble quartics and the two selmer group](../packages/ArithmeticStatistics/README.md#locally-soluble-quartics-and-the-two-selmer-group) | retained |

| `ArithmeticStatistics:ST.1/primitive-vectors-extend-to-special-linear-matrices` | [§1.7 primitive vectors extend to special linear matrices](../packages/ArithmeticStatistics/README.md#primitive-vectors-extend-to-special-linear-matrices) | retained |

| `ArithmeticStatistics:ST.1/ternary-cubic-forms-and-their-invariants` | [§1.7 ternary cubic forms and their invariants](../packages/ArithmeticStatistics/README.md#ternary-cubic-forms-and-their-invariants) | retained |

| `ArithmeticStatistics:ST.1/invariance-of-ternary-cubic-invariants` | [§1.7 invariance of ternary cubic invariants](../packages/ArithmeticStatistics/README.md#invariance-of-ternary-cubic-invariants) | retained |

| `ArithmeticStatistics:ST.1/projection-of-a-plane-cubic-from-a-rational-point` | [§1.7 projection of a plane cubic from a rational point](../packages/ArithmeticStatistics/README.md#projection-of-a-plane-cubic-from-a-rational-point) | retained |

| `ArithmeticStatistics:ST.1/cubic-invariant-of-the-projected-quartic` | [§1.7 cubic invariant of the projected quartic](../packages/ArithmeticStatistics/README.md#cubic-invariant-of-the-projected-quartic) | retained |

| `ArithmeticStatistics:ST.1/local-integral-representatives-of-soluble-quartics` | [§1.7 local integral representatives of soluble quartics](../packages/ArithmeticStatistics/README.md#local-integral-representatives-of-soluble-quartics) | retained |

| `ArithmeticStatistics:ST.1/integrality-from-local-integrality` | [§1.7 integrality from local integrality](../packages/ArithmeticStatistics/README.md#integrality-from-local-integrality) | retained |

| `ArithmeticStatistics:ST.1/integral-representatives-of-locally-soluble-quartics` | [§1.7 integral representatives of locally soluble quartics](../packages/ArithmeticStatistics/README.md#integral-representatives-of-locally-soluble-quartics) | retained |

| `ArithmeticStatistics:ST.1/binary-quartic-parametrization-of-two-selmer` | [§1.7 binary quartic parametrization of two selmer](../packages/ArithmeticStatistics/README.md#binary-quartic-parametrization-of-two-selmer) | retained |

| `ArithmeticStatistics:ST.1/comparison-with-the-cohomological-two-selmer-group` | [§1.7 comparison with the cohomological two selmer group](../packages/ArithmeticStatistics/README.md#comparison-with-the-cohomological-two-selmer-group) | retained |

| `ArithmeticStatistics:ST.1/embedding-into-pairs-of-ternary-quadratic-forms` | [§1.8 embedding into pairs of ternary quadratic forms](../packages/ArithmeticStatistics/README.md#embedding-into-pairs-of-ternary-quadratic-forms) | retained |

| `ArithmeticStatistics:ST.1/special-orthogonal-group-of-the-veronese-form` | [§1.8 special orthogonal group of the veronese form](../packages/ArithmeticStatistics/README.md#special-orthogonal-group-of-the-veronese-form) | retained |

| `ArithmeticStatistics:ST.1/orbit-bijection-for-the-embedding` | [§1.8 orbit bijection for the embedding](../packages/ArithmeticStatistics/README.md#orbit-bijection-for-the-embedding) | retained |

| `ArithmeticStatistics:ST.1/fibres-of-the-embedding-are-uniformly-bounded` | [§1.8 fibres of the embedding are uniformly bounded](../packages/ArithmeticStatistics/README.md#fibres-of-the-embedding-are-uniformly-bounded) | retained |

| `ArithmeticStatistics:ST.2/chebyshev-bounds-for-prime-sums` | [§2.1 chebyshev bounds for prime sums](../packages/ArithmeticStatistics/README.md#chebyshev-bounds-for-prime-sums) | retained |

| `ArithmeticStatistics:ST.2/lattice-points-on-a-subvariety-in-a-dilated-region` | [§2.1 lattice points on a subvariety in a dilated region](../packages/ArithmeticStatistics/README.md#lattice-points-on-a-subvariety-in-a-dilated-region) | retained |

| `ArithmeticStatistics:ST.2/uniform-bound-for-points-of-a-subscheme-modulo-p` | [§2.1 uniform bound for points of a subscheme modulo p](../packages/ArithmeticStatistics/README.md#uniform-bound-for-points-of-a-subscheme-modulo-p) | retained |

| `ArithmeticStatistics:ST.2/geometric-sieve-small-primes` | [§2.1 geometric sieve small primes](../packages/ArithmeticStatistics/README.md#geometric-sieve-small-primes) | retained |

| `ArithmeticStatistics:ST.2/geometric-sieve-large-primes` | [§2.1 geometric sieve large primes](../packages/ArithmeticStatistics/README.md#geometric-sieve-large-primes) | retained |

| `ArithmeticStatistics:ST.2/quantitative-ekedahl-geometric-sieve` | [§2.1 quantitative ekedahl geometric sieve](../packages/ArithmeticStatistics/README.md#quantitative-ekedahl-geometric-sieve) | retained |

| `ArithmeticStatistics:ST.2/strongly-and-weakly-divisible-values` | [§2.1 strongly and weakly divisible values](../packages/ArithmeticStatistics/README.md#strongly-and-weakly-divisible-values) | retained |

| `ArithmeticStatistics:ST.2/strong-divisibility-lies-on-a-codimension-two-locus` | [§2.1 strong divisibility lies on a codimension two locus](../packages/ArithmeticStatistics/README.md#strong-divisibility-lies-on-a-codimension-two-locus) | retained |

| `ArithmeticStatistics:ST.2/discriminant-loci-of-codimension-two` | [§2.1 discriminant loci of codimension two](../packages/ArithmeticStatistics/README.md#discriminant-loci-of-codimension-two) | retained |

| `ArithmeticStatistics:ST.2/local-density-of-values-divisible-by-p-squared` | [§2.1 local density of values divisible by p squared](../packages/ArithmeticStatistics/README.md#local-density-of-values-divisible-by-p-squared) | retained |

| `ArithmeticStatistics:ST.2/functions-defined-by-congruence-conditions` | [§0.2 functions defined by congruence conditions](../packages/ArithmeticStatistics/README.md#acceptable-weight-function) | merged, full interface retained |

| `ArithmeticStatistics:ST.2/real-root-types-of-binary-quartic-forms` | [§2.2 real root types of binary quartic forms](../packages/ArithmeticStatistics/README.md#real-root-types-of-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/real-orbits-of-binary-quartic-forms-with-fixed-invariants` | [§2.2 real orbits of binary quartic forms with fixed invariants](../packages/ArithmeticStatistics/README.md#real-orbits-of-binary-quartic-forms-with-fixed-invariants) | retained |

| `ArithmeticStatistics:ST.2/stabilizers-of-real-binary-quartic-forms` | [§2.2 stabilizers of real binary quartic forms](../packages/ArithmeticStatistics/README.md#stabilizers-of-real-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/fundamental-sets-for-real-binary-quartic-orbits` | [§2.2 fundamental sets for real binary quartic orbits](../packages/ArithmeticStatistics/README.md#fundamental-sets-for-real-binary-quartic-orbits) | retained |

| `ArithmeticStatistics:ST.2/gauss-fundamental-domain-in-iwasawa-coordinates` | [§2.2 gauss fundamental domain in iwasawa coordinates](../packages/ArithmeticStatistics/README.md#gauss-fundamental-domain-in-iwasawa-coordinates) | retained |

| `ArithmeticStatistics:ST.2/hyperbolic-area-of-the-modular-fundamental-domain` | [§2.2 hyperbolic area of the modular fundamental domain](../packages/ArithmeticStatistics/README.md#hyperbolic-area-of-the-modular-fundamental-domain) | retained |

| `ArithmeticStatistics:ST.2/covolume-of-pgl2-z` | [§2.2 covolume of pgl2 z](../packages/ArithmeticStatistics/README.md#covolume-of-pgl2-z) | retained |

| `ArithmeticStatistics:ST.2/orbit-multiplicities-in-fundamental-multisets` | [§2.2 orbit multiplicities in fundamental multisets](../packages/ArithmeticStatistics/README.md#orbit-multiplicities-in-fundamental-multisets) | retained |

| `ArithmeticStatistics:ST.2/averaged-count-of-binary-quartic-orbits` | [§2.3 averaged count of binary quartic orbits](../packages/ArithmeticStatistics/README.md#averaged-count-of-binary-quartic-orbits) | retained |

| `ArithmeticStatistics:ST.2/averaging-formula-for-binary-quartic-forms` | [§2.3 averaging formula for binary quartic forms](../packages/ArithmeticStatistics/README.md#averaging-formula-for-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/reducible-binary-quartic-forms-in-the-main-body` | [§2.3 reducible binary quartic forms in the main body](../packages/ArithmeticStatistics/README.md#reducible-binary-quartic-forms-in-the-main-body) | retained |

| `ArithmeticStatistics:ST.2/reducible-monic-binary-cubic-forms` | [§2.3 reducible monic binary cubic forms](../packages/ArithmeticStatistics/README.md#reducible-monic-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/orbits-with-large-stabilizer-are-negligible` | [§2.3 orbits with large stabilizer are negligible](../packages/ArithmeticStatistics/README.md#orbits-with-large-stabilizer-are-negligible) | retained |

| `ArithmeticStatistics:ST.2/binary-quartic-lattice-points-in-the-cusp` | [§2.3 binary quartic lattice points in the cusp](../packages/ArithmeticStatistics/README.md#binary-quartic-lattice-points-in-the-cusp) | retained |

| `ArithmeticStatistics:ST.2/averaging-over-the-fundamental-domain-and-cutting-the-cusp` | [§2.3 averaging over the fundamental domain and cutting the cusp](../packages/ArithmeticStatistics/README.md#averaging-over-the-fundamental-domain-and-cutting-the-cusp) | retained |

| `ArithmeticStatistics:ST.2/jacobian-change-of-measure-for-binary-quartic-forms` | [§2.4 jacobian change of measure for binary quartic forms](../packages/ArithmeticStatistics/README.md#jacobian-change-of-measure-for-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/volume-of-the-fundamental-region-for-binary-quartic-forms` | [§2.4 volume of the fundamental region for binary quartic forms](../packages/ArithmeticStatistics/README.md#volume-of-the-fundamental-region-for-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/count-of-binary-quartic-forms-of-bounded-height` | [§2.4 count of binary quartic forms of bounded height](../packages/ArithmeticStatistics/README.md#count-of-binary-quartic-forms-of-bounded-height) | retained |

| `ArithmeticStatistics:ST.2/eligible-invariant-pairs-of-bounded-height` | [§2.4 eligible invariant pairs of bounded height](../packages/ArithmeticStatistics/README.md#eligible-invariant-pairs-of-bounded-height) | retained |

| `ArithmeticStatistics:ST.2/average-number-of-classes-per-eligible-invariant-pair` | [§2.4 average number of classes per eligible invariant pair](../packages/ArithmeticStatistics/README.md#average-number-of-classes-per-eligible-invariant-pair) | retained |

| `ArithmeticStatistics:ST.2/binary-quartic-counts-with-finitely-many-congruence-conditions` | [§2.5 binary quartic counts with finitely many congruence conditions](../packages/ArithmeticStatistics/README.md#binary-quartic-counts-with-finitely-many-congruence-conditions) | retained |

| `ArithmeticStatistics:ST.2/weighted-binary-quartic-counts-with-finitely-many-congruence-conditions` | [§2.5 weighted binary quartic counts with finitely many congruence conditions](../packages/ArithmeticStatistics/README.md#weighted-binary-quartic-counts-with-finitely-many-congruence-conditions) | retained |

| `ArithmeticStatistics:ST.2/uniformity-for-strongly-divisible-quartic-discriminants` | [§2.5 uniformity for strongly divisible quartic discriminants](../packages/ArithmeticStatistics/README.md#uniformity-for-strongly-divisible-quartic-discriminants) | retained |

| `ArithmeticStatistics:ST.2/weakly-divisible-quartic-discriminants-via-ternary-pairs` | [§2.5 weakly divisible quartic discriminants via ternary pairs](../packages/ArithmeticStatistics/README.md#weakly-divisible-quartic-discriminants-via-ternary-pairs) | retained |

| `ArithmeticStatistics:ST.2/uniformity-for-weakly-divisible-quartic-discriminants` | [§2.5 uniformity for weakly divisible quartic discriminants](../packages/ArithmeticStatistics/README.md#uniformity-for-weakly-divisible-quartic-discriminants) | retained |

| `ArithmeticStatistics:ST.2/uniformity-estimate-for-infinitely-many-congruence-conditions` | [§2.5 uniformity estimate for infinitely many congruence conditions](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-infinitely-many-congruence-conditions) | retained |

| `ArithmeticStatistics:ST.2/squarefree-sieve-for-binary-quartic-forms` | [§2.5 squarefree sieve for binary quartic forms](../packages/ArithmeticStatistics/README.md#squarefree-sieve-for-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.2/real-orbits-and-stabilizers-of-binary-cubic-forms` | [§2.6 real orbits and stabilizers of binary cubic forms](../packages/ArithmeticStatistics/README.md#real-orbits-and-stabilizers-of-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/stabilizers-of-irreducible-integral-binary-cubic-forms` | [§2.6 stabilizers of irreducible integral binary cubic forms](../packages/ArithmeticStatistics/README.md#stabilizers-of-irreducible-integral-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/reducible-binary-cubic-forms-in-the-main-body` | [§2.6 reducible binary cubic forms in the main body](../packages/ArithmeticStatistics/README.md#reducible-binary-cubic-forms-in-the-main-body) | retained |

| `ArithmeticStatistics:ST.2/binary-cubic-forms-with-cyclic-stabilizer` | [§2.6 binary cubic forms with cyclic stabilizer](../packages/ArithmeticStatistics/README.md#binary-cubic-forms-with-cyclic-stabilizer) | retained |

| `ArithmeticStatistics:ST.2/invariant-measure-on-binary-cubic-forms` | [§2.6 invariant measure on binary cubic forms](../packages/ArithmeticStatistics/README.md#invariant-measure-on-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/averaged-count-of-binary-cubic-orbits` | [§2.6 averaged count of binary cubic orbits](../packages/ArithmeticStatistics/README.md#averaged-count-of-binary-cubic-orbits) | retained |

| `ArithmeticStatistics:ST.2/averaging-formula-for-binary-cubic-forms` | [§2.6 averaging formula for binary cubic forms](../packages/ArithmeticStatistics/README.md#averaging-formula-for-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/binary-cubic-lattice-points-in-the-cusp` | [§2.6 binary cubic lattice points in the cusp](../packages/ArithmeticStatistics/README.md#binary-cubic-lattice-points-in-the-cusp) | retained |

| `ArithmeticStatistics:ST.2/davenport-count-of-binary-cubic-forms` | [§2.6 davenport count of binary cubic forms](../packages/ArithmeticStatistics/README.md#davenport-count-of-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/binary-cubic-counts-with-congruence-conditions` | [§2.6 binary cubic counts with congruence conditions](../packages/ArithmeticStatistics/README.md#binary-cubic-counts-with-congruence-conditions) | retained |

| `ArithmeticStatistics:ST.2/index-p-switching-for-binary-cubic-forms` | [§2.7 index p switching for binary cubic forms](../packages/ArithmeticStatistics/README.md#index-p-switching-for-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/uniformity-estimate-for-nonmaximal-binary-cubic-forms` | [§2.7 uniformity estimate for nonmaximal binary cubic forms](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-nonmaximal-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.2/uniformity-estimate-for-binary-cubic-discriminants` | [§2.7 uniformity estimate for binary cubic discriminants](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-binary-cubic-discriminants) | retained |

| `ArithmeticStatistics:ST.2/sieve-to-acceptable-functions-for-binary-cubic-forms` | [§2.7 sieve to acceptable functions for binary cubic forms](../packages/ArithmeticStatistics/README.md#sieve-to-acceptable-functions-for-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.3/number-field-counting-function` | [§3.1 number field counting function](../packages/ArithmeticStatistics/README.md#number-field-counting-function) | retained |

| `ArithmeticStatistics:ST.3/torsion-count-of-class-groups` | [§3.1 torsion count of class groups](../packages/ArithmeticStatistics/README.md#torsion-count-of-class-groups) | retained |

| `ArithmeticStatistics:ST.3/splitting-symbol-and-local-sets-of-binary-cubic-forms` | [§3.2 splitting symbol and local sets of binary cubic forms](../packages/ArithmeticStatistics/README.md#splitting-symbol-and-local-sets-of-binary-cubic-forms) | retained |

| `ArithmeticStatistics:ST.3/splitting-symbol-determines-the-reduction-mod-p` | [§3.2 splitting symbol determines the reduction mod p](../packages/ArithmeticStatistics/README.md#splitting-symbol-determines-the-reduction-mod-p) | retained |

| `ArithmeticStatistics:ST.3/densities-of-splitting-types` | [§3.2 densities of splitting types](../packages/ArithmeticStatistics/README.md#densities-of-splitting-types) | retained |

| `ArithmeticStatistics:ST.3/densities-of-splitting-types-of-maximal-forms` | [§3.2 densities of splitting types of maximal forms](../packages/ArithmeticStatistics/README.md#densities-of-splitting-types-of-maximal-forms) | retained |

| `ArithmeticStatistics:ST.3/densities-of-maximal-and-nowhere-totally-ramified-forms` | [§3.2 densities of maximal and nowhere totally ramified forms](../packages/ArithmeticStatistics/README.md#densities-of-maximal-and-nowhere-totally-ramified-forms) | retained |

| `ArithmeticStatistics:ST.3/maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields` | [§3.2 maximal irreducible cubic rings are rings of integers of cubic fields](../packages/ArithmeticStatistics/README.md#maximal-irreducible-cubic-rings-are-rings-of-integers-of-cubic-fields) | retained |

| `ArithmeticStatistics:ST.3/davenport-heilbronn-count-of-cubic-fields` | [§3.2 davenport heilbronn count of cubic fields](../packages/ArithmeticStatistics/README.md#davenport-heilbronn-count-of-cubic-fields) | retained |

| `ArithmeticStatistics:ST.3/nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent` | [§3.3 nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](../packages/ArithmeticStatistics/README.md#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent) | retained |

| `ArithmeticStatistics:ST.3/three-torsion-of-quadratic-class-groups-counts-cubic-fields` | [§3.3 three torsion of quadratic class groups counts cubic fields](../packages/ArithmeticStatistics/README.md#three-torsion-of-quadratic-class-groups-counts-cubic-fields) | retained |

| `ArithmeticStatistics:ST.3/cubic-fields-totally-ramified-at-large-primes-are-sparse` | [§3.3 cubic fields totally ramified at large primes are sparse](../packages/ArithmeticStatistics/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse) | retained |

| `ArithmeticStatistics:ST.3/squarefree-integers-in-residue-classes-modulo-four` | [§3.3 squarefree integers in residue classes modulo four](../packages/ArithmeticStatistics/README.md#squarefree-integers-in-residue-classes-modulo-four) | retained |

| `ArithmeticStatistics:ST.3/count-of-quadratic-fields` | [§3.3 count of quadratic fields](../packages/ArithmeticStatistics/README.md#count-of-quadratic-fields) | retained |

| `ArithmeticStatistics:ST.3/davenport-heilbronn-mean-of-three-torsion` | [§3.3 davenport heilbronn mean of three torsion](../packages/ArithmeticStatistics/README.md#davenport-heilbronn-mean-of-three-torsion) | retained |

| `ArithmeticStatistics:ST.3/acceptable-local-specifications-for-cubic-orders` | [§3.4 acceptable local specifications for cubic orders](../packages/ArithmeticStatistics/README.md#acceptable-local-specifications-for-cubic-orders) | retained |

| `ArithmeticStatistics:ST.3/p-adic-density-of-a-local-specification` | [§3.4 p adic density of a local specification](../packages/ArithmeticStatistics/README.md#p-adic-density-of-a-local-specification) | retained |

| `ArithmeticStatistics:ST.3/density-of-cubic-orders-with-local-specifications` | [§3.4 density of cubic orders with local specifications](../packages/ArithmeticStatistics/README.md#density-of-cubic-orders-with-local-specifications) | retained |

| `ArithmeticStatistics:ST.3/roberts-second-order-term-for-cubic-fields` | [§3.5 roberts second order term for cubic fields](../packages/ArithmeticStatistics/README.md#roberts-second-order-term-for-cubic-fields) | retained |

| `ArithmeticStatistics:ST.3/second-order-term-for-the-mean-of-three-torsion` | [§3.5 second order term for the mean of three torsion](../packages/ArithmeticStatistics/README.md#second-order-term-for-the-mean-of-three-torsion) | retained |

| `ArithmeticStatistics:ST.3/second-order-term-for-cubic-orders-with-local-specifications` | [§3.5 second order term for cubic orders with local specifications](../packages/ArithmeticStatistics/README.md#second-order-term-for-cubic-orders-with-local-specifications) | retained |

| `ArithmeticStatistics:ST.3/mertens-count-of-positive-definite-binary-quadratic-forms` | [§3.6 mertens count of positive definite binary quadratic forms](../packages/ArithmeticStatistics/README.md#mertens-count-of-positive-definite-binary-quadratic-forms) | retained |

| `ArithmeticStatistics:ST.3/siegel-count-of-indefinite-binary-quadratic-forms` | [§3.6 siegel count of indefinite binary quadratic forms](../packages/ArithmeticStatistics/README.md#siegel-count-of-indefinite-binary-quadratic-forms) | retained |

| `ArithmeticStatistics:ST.3/quoted-classical-counts-for-binary-quadratic-and-cubic-forms` | [§3.6 quoted classical counts for binary quadratic and cubic forms](../packages/ArithmeticStatistics/README.md#quoted-classical-counts-for-binary-quadratic-and-cubic-forms) | retained |

| `ArithmeticStatistics:ST.3/bhargava-count-of-quartic-fields` | [§3.7 bhargava count of quartic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quartic-fields) | retained |

| `ArithmeticStatistics:ST.3/bhargava-count-of-quintic-fields` | [§3.7 bhargava count of quintic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quintic-fields) | retained |

| `ArithmeticStatistics:ST.3/bhargava-shankar-wang-counts-over-number-fields` | [§3.7 bhargava shankar wang counts over number fields](../packages/ArithmeticStatistics/README.md#bhargava-shankar-wang-counts-over-number-fields) | retained |

| `ArithmeticStatistics:ST.3/bhargava-mean-of-two-torsion-in-cubic-class-groups` | [§3.7 bhargava mean of two torsion in cubic class groups](../packages/ArithmeticStatistics/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups) | retained |

| `ArithmeticStatistics:ST.3/fouvry-kluners-moments-of-four-ranks` | [§3.8 fouvry kluners moments of four ranks](../packages/ArithmeticStatistics/README.md#fouvry-kluners-moments-of-four-ranks) | retained |

| `ArithmeticStatistics:ST.3/cohen-lenstra-moment-prediction` | [§3.8 cohen lenstra moment prediction](../packages/ArithmeticStatistics/README.md#cohen-lenstra-moment-prediction) | retained |

| `ArithmeticStatistics:ST.3/malle-invariants-of-a-permutation-group` | [§3.9 malle invariants of a permutation group](../packages/ArithmeticStatistics/README.md#malle-invariants-of-a-permutation-group) | retained |

| `ArithmeticStatistics:ST.3/malle-conjecture` | [§3.9 malle conjecture](../packages/ArithmeticStatistics/README.md#malle-conjecture) | retained |

| `ArithmeticStatistics:ST.3/kluners-counterexample-to-malle-conjecture` | [§3.9 kluners counterexample to malle conjecture](../packages/ArithmeticStatistics/README.md#kluners-counterexample-to-malle-conjecture) | retained |

| `ArithmeticStatistics:ST.4/rational-orbit-weight` | [§4.1 rational orbit weight](../packages/ArithmeticStatistics/README.md#rational-orbit-weight) | retained |

| `ArithmeticStatistics:ST.4/locally-soluble-forms-attached-to-a-family` | [§4.1 locally soluble forms attached to a family](../packages/ArithmeticStatistics/README.md#locally-soluble-forms-attached-to-a-family) | retained |

| `ArithmeticStatistics:ST.4/local-masses-of-a-family` | [§4.1 local masses of a family](../packages/ArithmeticStatistics/README.md#local-masses-of-a-family) | retained |

| `ArithmeticStatistics:ST.4/average-over-a-height-ordered-family` | [§4.1 average over a height ordered family](../packages/ArithmeticStatistics/README.md#average-over-a-height-ordered-family) | retained |

| `ArithmeticStatistics:ST.4/orbit-weight-as-a-stabilizer-sum` | [§4.1 orbit weight as a stabilizer sum](../packages/ArithmeticStatistics/README.md#orbit-weight-as-a-stabilizer-sum) | retained |

| `ArithmeticStatistics:ST.4/cartan-decomposition-of-pgl2-over-qp` | [§4.2 cartan decomposition of pgl2 over qp](../packages/ArithmeticStatistics/README.md#cartan-decomposition-of-pgl2-over-qp) | retained |

| `ArithmeticStatistics:ST.4/nonintegral-local-translates-force-square-discriminant` | [§4.2 nonintegral local translates force square discriminant](../packages/ArithmeticStatistics/README.md#nonintegral-local-translates-force-square-discriminant) | retained |

| `ArithmeticStatistics:ST.4/class-number-one-for-pgl2-over-q` | [§4.2 class number one for pgl2 over q](../packages/ArithmeticStatistics/README.md#class-number-one-for-pgl2-over-q) | retained |

| `ArithmeticStatistics:ST.4/global-weight-is-product-of-local-weights` | [§4.2 global weight is product of local weights](../packages/ArithmeticStatistics/README.md#global-weight-is-product-of-local-weights) | retained |

| `ArithmeticStatistics:ST.4/count-of-squarefree-monic-polynomials-over-a-finite-field` | [§0.9 count of squarefree monic polynomials over a finite field](../packages/ArithmeticStatistics/README.md#count-of-squarefree-monic-polynomials-over-a-finite-field) | retained; layer 4→0 |

| `ArithmeticStatistics:ST.4/count-of-nonsingular-binary-quartic-forms-over-a-finite-field` | [§4.3 count of nonsingular binary quartic forms over a finite field](../packages/ArithmeticStatistics/README.md#count-of-nonsingular-binary-quartic-forms-over-a-finite-field) | retained |

| `ArithmeticStatistics:ST.4/nonsingular-binary-quartic-forms-over-finite-fields-are-soluble` | [§4.3 nonsingular binary quartic forms over finite fields are soluble](../packages/ArithmeticStatistics/README.md#nonsingular-binary-quartic-forms-over-finite-fields-are-soluble) | retained |

| `ArithmeticStatistics:ST.4/local-solubility-away-from-square-discriminant` | [§4.3 local solubility away from square discriminant](../packages/ArithmeticStatistics/README.md#local-solubility-away-from-square-discriminant) | retained |

| `ArithmeticStatistics:ST.4/local-weights-and-solubility-are-locally-constant` | [§4.4 local weights and solubility are locally constant](../packages/ArithmeticStatistics/README.md#local-weights-and-solubility-are-locally-constant) | retained |

| `ArithmeticStatistics:ST.4/real-solubility-of-binary-quartic-forms` | [§4.4 real solubility of binary quartic forms](../packages/ArithmeticStatistics/README.md#real-solubility-of-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.4/jacobian-of-the-orbit-map` | [§4.5 jacobian of the orbit map](../packages/ArithmeticStatistics/README.md#jacobian-of-the-orbit-map) | retained |

| `ArithmeticStatistics:ST.4/volume-of-pgl2-zp` | [§4.5 volume of pgl2 zp](../packages/ArithmeticStatistics/README.md#volume-of-pgl2-zp) | retained |

| `ArithmeticStatistics:ST.4/p-adic-change-of-measure-for-binary-quartic-forms` | [§4.5 p adic change of measure for binary quartic forms](../packages/ArithmeticStatistics/README.md#p-adic-change-of-measure-for-binary-quartic-forms) | retained |

| `ArithmeticStatistics:ST.4/weighted-p-adic-change-of-measure` | [§4.5 weighted p adic change of measure](../packages/ArithmeticStatistics/README.md#weighted-p-adic-change-of-measure) | retained |

| `ArithmeticStatistics:ST.4/local-mass-formula-for-locally-soluble-forms` | [§4.5 local mass formula for locally soluble forms](../packages/ArithmeticStatistics/README.md#local-mass-formula-for-locally-soluble-forms) | retained |

| `ArithmeticStatistics:ST.4/two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup` | [§4.6 two division quotient of a group with a finite index zp subgroup](../packages/ArithmeticStatistics/README.md#two-division-quotient-of-a-group-with-a-finite-index-zp-subgroup) | retained |

| `ArithmeticStatistics:ST.4/local-two-descent-index` | [§4.6 local two descent index](../packages/ArithmeticStatistics/README.md#local-two-descent-index) | retained |

| `ArithmeticStatistics:ST.4/archimedean-selmer-ratio-is-one-half` | [§4.6 archimedean selmer ratio is one half](../packages/ArithmeticStatistics/README.md#archimedean-selmer-ratio-is-one-half) | retained |

| `ArithmeticStatistics:ST.4/local-selmer-mass-ratios` | [§4.6 local selmer mass ratios](../packages/ArithmeticStatistics/README.md#local-selmer-mass-ratios) | retained |

| `ArithmeticStatistics:ST.4/locally-soluble-set-is-cut-out-by-local-conditions` | [§4.7 locally soluble set is cut out by local conditions](../packages/ArithmeticStatistics/README.md#locally-soluble-set-is-cut-out-by-local-conditions) | retained |

| `ArithmeticStatistics:ST.4/selmer-count-as-weighted-orbit-count` | [§4.7 selmer count as weighted orbit count](../packages/ArithmeticStatistics/README.md#selmer-count-as-weighted-orbit-count) | retained |

| `ArithmeticStatistics:ST.4/count-of-locally-soluble-orbits-in-a-large-family` | [§4.9 count of locally soluble orbits in a large family](../packages/ArithmeticStatistics/README.md#count-of-locally-soluble-orbits-in-a-large-family) | retained |

| `ArithmeticStatistics:ST.4/bad-forms-have-square-discriminant` | [§4.7 bad forms have square discriminant](../packages/ArithmeticStatistics/README.md#bad-forms-have-square-discriminant) | retained |

| `ArithmeticStatistics:ST.4/count-of-real-soluble-integral-orbits` | [§4.7 count of real soluble integral orbits](../packages/ArithmeticStatistics/README.md#count-of-real-soluble-integral-orbits) | retained |

| `ArithmeticStatistics:ST.4/lattice-points-of-bounded-invariant-height` | [§4.8 lattice points of bounded invariant height](../packages/ArithmeticStatistics/README.md#lattice-points-of-bounded-invariant-height) | retained |

| `ArithmeticStatistics:ST.4/tail-estimate-for-square-divisors-of-the-discriminant` | [§4.8 tail estimate for square divisors of the discriminant](../packages/ArithmeticStatistics/README.md#tail-estimate-for-square-divisors-of-the-discriminant) | retained |

| `ArithmeticStatistics:ST.4/uniformity-estimate-for-elliptic-curves` | [§4.8 uniformity estimate for elliptic curves](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-elliptic-curves) | retained |

| `ArithmeticStatistics:ST.4/count-of-curves-in-a-large-family` | [§4.8 count of curves in a large family](../packages/ArithmeticStatistics/README.md#count-of-curves-in-a-large-family) | retained |

| `ArithmeticStatistics:ST.4/selmer-average-as-product-of-local-masses` | [§4.10 selmer average as product of local masses](../packages/ArithmeticStatistics/README.md#selmer-average-as-product-of-local-masses) | retained |

| `ArithmeticStatistics:ST.4/tamagawa-number-of-pgl2-is-two` | [§4.10 tamagawa number of pgl2 is two](../packages/ArithmeticStatistics/README.md#tamagawa-number-of-pgl2-is-two) | retained |

| `ArithmeticStatistics:ST.4/average-size-of-the-2-selmer-group-is-three` | [§4.10 average size of the 2 selmer group is three](../packages/ArithmeticStatistics/README.md#average-size-of-the-2-selmer-group-is-three) | retained |

| `ArithmeticStatistics:ST.4/families-of-theorems-1-1-and-1-3-have-positive-local-masses` | [§4.10 families of theorems 1 1 and 1 3 have positive local masses](../packages/ArithmeticStatistics/README.md#families-of-theorems-1-1-and-1-3-have-positive-local-masses) | retained |

| `ArithmeticStatistics:ST.4/average-selmer-size-over-all-curves-and-congruence-families` | [§4.10 average selmer size over all curves and congruence families](../packages/ArithmeticStatistics/README.md#average-selmer-size-over-all-curves-and-congruence-families) | retained |

| `ArithmeticStatistics:ST.4/two-selmer-rank-identity` | [§4.11 two selmer rank identity](../packages/ArithmeticStatistics/README.md#two-selmer-rank-identity) | retained |

| `ArithmeticStatistics:ST.4/rational-two-torsion-has-density-zero` | [§4.11 rational two torsion has density zero](../packages/ArithmeticStatistics/README.md#rational-two-torsion-has-density-zero) | retained |

| `ArithmeticStatistics:ST.4/rank-bound-from-the-selmer-average` | [§4.11 rank bound from the selmer average](../packages/ArithmeticStatistics/README.md#rank-bound-from-the-selmer-average) | retained |

| `ArithmeticStatistics:ST.4/average-two-rank-of-sha-is-at-most-three-halves` | [§4.11 average two rank of sha is at most three halves](../packages/ArithmeticStatistics/README.md#average-two-rank-of-sha-is-at-most-three-halves) | retained |

| `ArithmeticStatistics:ST.5/height-moments-in-an-arithmetic-family` | [§4.12 height moments in an arithmetic family](../packages/ArithmeticStatistics/README.md#height-moments-in-an-arithmetic-family) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/gaussian-binomial-coefficient` | [§3.10 gaussian binomial coefficient](../packages/ArithmeticStatistics/README.md#gaussian-binomial-coefficient) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cauchy-q-binomial-theorem` | [§3.10 cauchy q binomial theorem](../packages/ArithmeticStatistics/README.md#cauchy-q-binomial-theorem) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/isomorphism-classes-of-finite-abelian-p-groups` | [§3.11 isomorphism classes of finite abelian p groups](../packages/ArithmeticStatistics/README.md#isomorphism-classes-of-finite-abelian-p-groups) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/automorphism-count-of-finite-abelian-p-groups` | [§3.11 automorphism count of finite abelian p groups](../packages/ArithmeticStatistics/README.md#automorphism-count-of-finite-abelian-p-groups) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/surjection-count` | [§3.11 surjection count](../packages/ArithmeticStatistics/README.md#surjection-count) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/exact-surjection-count-formula` | [§3.11 exact surjection count formula](../packages/ArithmeticStatistics/README.md#exact-surjection-count-formula) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-measure` | [§3.11 cohen lenstra measure](../packages/ArithmeticStatistics/README.md#cohen-lenstra-measure) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/partitions-with-large-parts-by-largest-part` | [§3.11 partitions with large parts by largest part](../packages/ArithmeticStatistics/README.md#partitions-with-large-parts-by-largest-part) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/hall-partition-identity` | [§3.11 hall partition identity](../packages/ArithmeticStatistics/README.md#hall-partition-identity) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/weighted-inverse-automorphism-sum` | [§3.11 weighted inverse automorphism sum](../packages/ArithmeticStatistics/README.md#weighted-inverse-automorphism-sum) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-mass-formula` | [§3.11 cohen lenstra mass formula](../packages/ArithmeticStatistics/README.md#cohen-lenstra-mass-formula) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/surjection-moment` | [§3.12 surjection moment](../packages/ArithmeticStatistics/README.md#surjection-moment) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/extension-groupoid-of-finite-abelian-groups` | [§3.12 extension groupoid of finite abelian groups](../packages/ArithmeticStatistics/README.md#extension-groupoid-of-finite-abelian-groups) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/surjection-weighted-class-count` | [§3.12 surjection weighted class count](../packages/ArithmeticStatistics/README.md#surjection-weighted-class-count) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-moments` | [§3.12 cohen lenstra moments](../packages/ArithmeticStatistics/README.md#cohen-lenstra-moments) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-contraction-constant` | [§3.13 cohen lenstra contraction constant](../packages/ArithmeticStatistics/README.md#cohen-lenstra-contraction-constant) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/moments-determine-the-cohen-lenstra-measure` | [§3.13 moments determine the cohen lenstra measure](../packages/ArithmeticStatistics/README.md#moments-determine-the-cohen-lenstra-measure) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/enlargement-of-finite-abelian-p-groups` | [§3.13 enlargement of finite abelian p groups](../packages/ArithmeticStatistics/README.md#enlargement-of-finite-abelian-p-groups) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/aggregate-enlargement-inequality` | [§3.13 aggregate enlargement inequality](../packages/ArithmeticStatistics/README.md#aggregate-enlargement-inequality) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/partition-tail-domination` | [§3.13 partition tail domination](../packages/ArithmeticStatistics/README.md#partition-tail-domination) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/finite-enlargement-domination-of-tails` | [§3.13 finite enlargement domination of tails](../packages/ArithmeticStatistics/README.md#finite-enlargement-domination-of-tails) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/finite-moment-control-of-masses` | [§3.13 finite moment control of masses](../packages/ArithmeticStatistics/README.md#finite-moment-control-of-masses) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/moment-convergence-implies-distribution-convergence` | [§3.13 moment convergence implies distribution convergence](../packages/ArithmeticStatistics/README.md#moment-convergence-implies-distribution-convergence) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/distribution-convergence-does-not-force-moment-convergence` | [§3.13 distribution convergence does not force moment convergence](../packages/ArithmeticStatistics/README.md#distribution-convergence-does-not-force-moment-convergence) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u` | [§3.13 moments determine cohen lenstra limits for all p and u](../packages/ArithmeticStatistics/README.md#moments-determine-cohen-lenstra-limits-for-all-p-and-u) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cokernel-law-of-haar-random-p-adic-matrices` | [§3.14 cokernel law of haar random p adic matrices](../packages/ArithmeticStatistics/README.md#cokernel-law-of-haar-random-p-adic-matrices) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/haar-matrix-cokernel-surjection-moments` | [§3.14 haar matrix cokernel surjection moments](../packages/ArithmeticStatistics/README.md#haar-matrix-cokernel-surjection-moments) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/friedman-washington-cokernel-law` | [§3.14 friedman washington cokernel law](../packages/ArithmeticStatistics/README.md#friedman-washington-cokernel-law) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/friedman-washington-translation-form` | [§3.14 friedman washington translation form](../packages/ArithmeticStatistics/README.md#friedman-washington-translation-form) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-measure-over-a-finite-set-of-primes` | [§3.14 cohen lenstra measure over a finite set of primes](../packages/ArithmeticStatistics/README.md#cohen-lenstra-measure-over-a-finite-set-of-primes) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-lenstra-heuristic-for-quadratic-fields` | [§5.1 cohen lenstra heuristic for quadratic fields](../packages/ArithmeticStatistics/README.md#cohen-lenstra-heuristic-for-quadratic-fields) | retained |

| `ArithmeticStatistics:ST.5/cohen-lenstra-moment-conjecture-for-quadratic-fields` | [§5.1 cohen lenstra moment conjecture for quadratic fields](../packages/ArithmeticStatistics/README.md#cohen-lenstra-moment-conjecture-for-quadratic-fields) | retained |

| `ArithmeticStatistics:ST.5/cohen-lenstra-moment-form-implies-heuristic` | [§5.1 cohen lenstra moment form implies heuristic](../packages/ArithmeticStatistics/README.md#cohen-lenstra-moment-form-implies-heuristic) | retained |

| `ArithmeticStatistics:ST.5/matrix-kernel-law-over-a-finite-field` | [§3.15 matrix kernel law over a finite field](../packages/ArithmeticStatistics/README.md#matrix-kernel-law-over-a-finite-field) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/rank-count-of-matrices-over-a-finite-field` | [§3.15 rank count of matrices over a finite field](../packages/ArithmeticStatistics/README.md#rank-count-of-matrices-over-a-finite-field) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-matrix-kernel-law` | [§3.15 symmetric matrix kernel law](../packages/ArithmeticStatistics/README.md#symmetric-matrix-kernel-law) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/macwilliams-symmetric-rank-count` | [§3.17 macwilliams symmetric rank count](../packages/ArithmeticStatistics/README.md#macwilliams-symmetric-rank-count) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/limit-of-the-symmetric-kernel-law` | [§3.17 limit of the symmetric kernel law](../packages/ArithmeticStatistics/README.md#limit-of-the-symmetric-kernel-law) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/koymans-pagano-rank-identity` | [§3.15 koymans pagano rank identity](../packages/ArithmeticStatistics/README.md#koymans-pagano-rank-identity) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/cohen-martinet-predicted-surjection-moment` | [§5.2 cohen martinet predicted surjection moment](../packages/ArithmeticStatistics/README.md#cohen-martinet-predicted-surjection-moment) | retained |

| `ArithmeticStatistics:ST.5/cohen-lenstra-martinet-average-conjecture` | [§5.2 cohen lenstra martinet average conjecture](../packages/ArithmeticStatistics/README.md#cohen-lenstra-martinet-average-conjecture) | retained |

| `ArithmeticStatistics:ST.5/cohen-martinet-surjection-moment-conjecture` | [§5.2 cohen martinet surjection moment conjecture](../packages/ArithmeticStatistics/README.md#cohen-martinet-surjection-moment-conjecture) | retained |

| `ArithmeticStatistics:ST.5/relative-three-torsion-as-irreducible-hom-count` | [§5.2 relative three torsion as irreducible hom count](../packages/ArithmeticStatistics/README.md#relative-three-torsion-as-irreducible-hom-count) | retained |

| `ArithmeticStatistics:ST.5/cohen-martinet-prediction-for-relative-three-torsion` | [§5.2 cohen martinet prediction for relative three torsion](../packages/ArithmeticStatistics/README.md#cohen-martinet-prediction-for-relative-three-torsion) | retained |

| `ArithmeticStatistics:ST.5/cohen-martinet-prediction-for-three-torsion-of-two-extensions` | [§5.2 cohen martinet prediction for three torsion of two extensions](../packages/ArithmeticStatistics/README.md#cohen-martinet-prediction-for-three-torsion-of-two-extensions) | retained |

| `ArithmeticStatistics:ST.5/dihedral-quartic-proven-average-versus-prediction` | [§5.2 dihedral quartic proven average versus prediction](../packages/ArithmeticStatistics/README.md#dihedral-quartic-proven-average-versus-prediction) | retained |

| `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-finite-level-law` | [§5.3 enhanced cohen lenstra finite level law](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-finite-level-law) | retained |

| `ArithmeticStatistics:ST.5/zero-cokernel-probability-at-two` | [§5.3 zero cokernel probability at two](../packages/ArithmeticStatistics/README.md#zero-cokernel-probability-at-two) | retained |

| `ArithmeticStatistics:ST.5/zero-cokernel-probability-lower-bound-at-odd-primes` | [§5.3 zero cokernel probability lower bound at odd primes](../packages/ArithmeticStatistics/README.md#zero-cokernel-probability-lower-bound-at-odd-primes) | retained |

| `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-conjecture` | [§5.3 enhanced cohen lenstra conjecture](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-conjecture) | retained |

| `ArithmeticStatistics:ST.5/maximal-isotropic-subspaces-of-a-quadratic-space` | [§5.4 maximal isotropic subspaces of a quadratic space](../packages/ArithmeticStatistics/README.md#maximal-isotropic-subspaces-of-a-quadratic-space) | retained |

| `ArithmeticStatistics:ST.5/isotropic-reduction-map` | [§5.4 isotropic reduction map](../packages/ArithmeticStatistics/README.md#isotropic-reduction-map) | retained |

| `ArithmeticStatistics:ST.5/fibres-of-the-isotropic-reduction-map` | [§5.4 fibres of the isotropic reduction map](../packages/ArithmeticStatistics/README.md#fibres-of-the-isotropic-reduction-map) | retained |

| `ArithmeticStatistics:ST.5/number-of-maximal-isotropic-subspaces` | [§5.4 number of maximal isotropic subspaces](../packages/ArithmeticStatistics/README.md#number-of-maximal-isotropic-subspaces) | retained |

| `ArithmeticStatistics:ST.5/intersection-dimension-generating-function` | [§5.4 intersection dimension generating function](../packages/ArithmeticStatistics/README.md#intersection-dimension-generating-function) | retained |

| `ArithmeticStatistics:ST.5/intersection-dimension-law-closed-form` | [§5.4 intersection dimension law closed form](../packages/ArithmeticStatistics/README.md#intersection-dimension-law-closed-form) | retained |

| `ArithmeticStatistics:ST.5/poonen-rains-distribution` | [§5.5 poonen rains distribution](../packages/ArithmeticStatistics/README.md#poonen-rains-distribution) | retained |

| `ArithmeticStatistics:ST.5/intersection-law-converges-to-poonen-rains` | [§5.5 intersection law converges to poonen rains](../packages/ArithmeticStatistics/README.md#intersection-law-converges-to-poonen-rains) | retained |

| `ArithmeticStatistics:ST.5/poonen-rains-moments` | [§5.5 poonen rains moments](../packages/ArithmeticStatistics/README.md#poonen-rains-moments) | retained |

| `ArithmeticStatistics:ST.5/poonen-rains-parity` | [§5.5 poonen rains parity](../packages/ArithmeticStatistics/README.md#poonen-rains-parity) | retained |

| `ArithmeticStatistics:ST.5/delaunay-sha-p-rank-law` | [§5.5 delaunay sha p rank law](../packages/ArithmeticStatistics/README.md#delaunay-sha-p-rank-law) | retained |

| `ArithmeticStatistics:ST.5/delaunay-compatibility-of-the-selmer-model` | [§5.5 delaunay compatibility of the selmer model](../packages/ArithmeticStatistics/README.md#delaunay-compatibility-of-the-selmer-model) | retained |

| `ArithmeticStatistics:ST.5/count-of-nondegenerate-alternating-matrices` | [§5.6 count of nondegenerate alternating matrices](../packages/ArithmeticStatistics/README.md#count-of-nondegenerate-alternating-matrices) | retained |

| `ArithmeticStatistics:ST.5/alternating-matrix-kernel-law` | [§5.6 alternating matrix kernel law](../packages/ArithmeticStatistics/README.md#alternating-matrix-kernel-law) | retained |

| `ArithmeticStatistics:ST.5/alternating-kernel-law-formula` | [§5.6 alternating kernel law formula](../packages/ArithmeticStatistics/README.md#alternating-kernel-law-formula) | retained |

| `ArithmeticStatistics:ST.5/alternating-kernel-law-limit-is-poonen-rains` | [§5.6 alternating kernel law limit is poonen rains](../packages/ArithmeticStatistics/README.md#alternating-kernel-law-limit-is-poonen-rains) | retained |

| `ArithmeticStatistics:ST.5/symplectic-finite-abelian-p-groups` | [§5.6 symplectic finite abelian p groups](../packages/ArithmeticStatistics/README.md#symplectic-finite-abelian-p-groups) | retained |

| `ArithmeticStatistics:ST.5/alternating-cokernel-law` | [§5.6 alternating cokernel law](../packages/ArithmeticStatistics/README.md#alternating-cokernel-law) | retained |

| `ArithmeticStatistics:ST.5/bklpr-alternating-cokernel-limit` | [§5.6 bklpr alternating cokernel limit](../packages/ArithmeticStatistics/README.md#bklpr-alternating-cokernel-limit) | retained |

| `ArithmeticStatistics:ST.5/bklpr-model` | [§5.7 bklpr model](../packages/ArithmeticStatistics/README.md#bklpr-model) | retained |

| `ArithmeticStatistics:ST.5/bklpr-random-isotropic-intersection-law` | [§5.7 bklpr random isotropic intersection law](../packages/ArithmeticStatistics/README.md#bklpr-random-isotropic-intersection-law) | retained |

| `ArithmeticStatistics:ST.5/maximal-isotropic-direct-summands-modulo-prime-powers` | [§5.7 maximal isotropic direct summands modulo prime powers](../packages/ArithmeticStatistics/README.md#maximal-isotropic-direct-summands-modulo-prime-powers) | retained |

| `ArithmeticStatistics:ST.5/bklpr-injection-moments` | [§5.7 bklpr injection moments](../packages/ArithmeticStatistics/README.md#bklpr-injection-moments) | retained |

| `ArithmeticStatistics:ST.5/poonen-rains-selmer-conjecture` | [§5.8 poonen rains selmer conjecture](../packages/ArithmeticStatistics/README.md#poonen-rains-selmer-conjecture) | retained |

| `ArithmeticStatistics:ST.5/bhargava-shankar-selmer-average-conjecture` | [§5.8 bhargava shankar selmer average conjecture](../packages/ArithmeticStatistics/README.md#bhargava-shankar-selmer-average-conjecture) | retained |

| `ArithmeticStatistics:ST.5/selmer-average-conjecture-implies-rank-at-most-one` | [§5.8 selmer average conjecture implies rank at most one](../packages/ArithmeticStatistics/README.md#selmer-average-conjecture-implies-rank-at-most-one) | retained |

| `ArithmeticStatistics:ST.5/bklpr-selmer-conjecture` | [§5.8 bklpr selmer conjecture](../packages/ArithmeticStatistics/README.md#bklpr-selmer-conjecture) | retained |

| `ArithmeticStatistics:ST.5/rational-p-torsion-has-density-zero` | [§4.13 rational p torsion has density zero](../packages/ArithmeticStatistics/README.md#rational-p-torsion-has-density-zero) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/bklpr-conjecture-implies-rank-and-selmer-laws` | [§5.8 bklpr conjecture implies rank and selmer laws](../packages/ArithmeticStatistics/README.md#bklpr-conjecture-implies-rank-and-selmer-laws) | retained |

| `ArithmeticStatistics:ST.5/average-size-of-the-3-selmer-group` | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/average-rank-bound-from-the-3-selmer-average` | [§4.14 average rank bound from the 3 selmer average](../packages/ArithmeticStatistics/README.md#average-rank-bound-from-the-3-selmer-average) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/average-size-of-the-4-selmer-group` | [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/average-size-of-the-5-selmer-group` | [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/second-moment-of-the-2-selmer-group` | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/two-selmer-distribution-in-full-two-torsion-twist-families` | [§5.9 two selmer distribution in full two torsion twist families](../packages/ArithmeticStatistics/README.md#two-selmer-distribution-in-full-two-torsion-twist-families) | retained |

| `ArithmeticStatistics:ST.5/function-field-3-selmer-average-bound` | [§5.9 function field 3 selmer average bound](../packages/ArithmeticStatistics/README.md#function-field-3-selmer-average-bound) | retained |

| `ArithmeticStatistics:ST.5/p-infinity-selmer-corank-distribution-in-twist-families` | [§5.9 p infinity selmer corank distribution in twist families](../packages/ArithmeticStatistics/README.md#p-infinity-selmer-corank-distribution-in-twist-families) | retained |

| `ArithmeticStatistics:ST.5/smith-twist-family-hypothesis` | [§5.9 smith twist family hypothesis](../packages/ArithmeticStatistics/README.md#smith-twist-family-hypothesis) | retained |

| `ArithmeticStatistics:ST.5/congruent-number-curve-satisfies-smith-hypothesis` | [§5.9 congruent number curve satisfies smith hypothesis](../packages/ArithmeticStatistics/README.md#congruent-number-curve-satisfies-smith-hypothesis) | retained |

| `ArithmeticStatistics:ST.5/smith-selmer-rank-limit-equals-corank` | [§5.9 smith selmer rank limit equals corank](../packages/ArithmeticStatistics/README.md#smith-selmer-rank-limit-equals-corank) | retained |

| `ArithmeticStatistics:ST.5/two-point-corank-law-forces-zero-density-of-high-corank` | [§5.9 two point corank law forces zero density of high corank](../packages/ArithmeticStatistics/README.md#two-point-corank-law-forces-zero-density-of-high-corank) | retained |

| `ArithmeticStatistics:ST.5/even-congruent-twists-have-corank-zero-given-smith-law` | [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law) | retained |

| `ArithmeticStatistics:ST.5/selmer-ratio-of-an-isogeny` | [§5.10 selmer ratio of an isogeny](../packages/ArithmeticStatistics/README.md#selmer-ratio-of-an-isogeny) | retained |

| `ArithmeticStatistics:ST.5/local-selmer-ratio-via-tamagawa-numbers` | [§5.10 local selmer ratio via tamagawa numbers](../packages/ArithmeticStatistics/README.md#local-selmer-ratio-via-tamagawa-numbers) | retained |

| `ArithmeticStatistics:ST.5/tamagawa-ratio-under-potentially-good-reduction` | [§5.10 tamagawa ratio under potentially good reduction](../packages/ArithmeticStatistics/README.md#tamagawa-ratio-under-potentially-good-reduction) | retained |

| `ArithmeticStatistics:ST.5/selmer-ratio-classes-are-locally-defined` | [§5.10 selmer ratio classes are locally defined](../packages/ArithmeticStatistics/README.md#selmer-ratio-classes-are-locally-defined) | retained |

| `ArithmeticStatistics:ST.5/bklos-average-size-of-three-isogeny-selmer-groups` | [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups) | retained |

| `ArithmeticStatistics:ST.5/cassels-isogeny-selmer-ratio-formula` | [§5.10 cassels isogeny selmer ratio formula](../packages/ArithmeticStatistics/README.md#cassels-isogeny-selmer-ratio-formula) | retained |

| `ArithmeticStatistics:ST.5/isogeny-factorisation-selmer-exact-sequence` | [§5.10 isogeny factorisation selmer exact sequence](../packages/ArithmeticStatistics/README.md#isogeny-factorisation-selmer-exact-sequence) | retained |

| `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity` | [§5.10 three isogeny selmer parity](../packages/ArithmeticStatistics/README.md#three-isogeny-selmer-parity) | retained |

| `ArithmeticStatistics:ST.5/finitely-many-twists-with-rational-p-torsion` | [§5.10 finitely many twists with rational p torsion](../packages/ArithmeticStatistics/README.md#finitely-many-twists-with-rational-p-torsion) | retained |

| `ArithmeticStatistics:ST.5/reduced-p-selmer-rank-bounds-the-corank` | [§5.10 reduced p selmer rank bounds the corank](../packages/ArithmeticStatistics/README.md#reduced-p-selmer-rank-bounds-the-corank) | retained |

| `ArithmeticStatistics:ST.5/three-selmer-rank-zero-in-selmer-ratio-one-twists` | [§5.10 three selmer rank zero in selmer ratio one twists](../packages/ArithmeticStatistics/README.md#three-selmer-rank-zero-in-selmer-ratio-one-twists) | retained |

| `ArithmeticStatistics:ST.5/three-selmer-rank-one-in-odd-selmer-ratio-twists` | [§5.10 three selmer rank one in odd selmer ratio twists](../packages/ArithmeticStatistics/README.md#three-selmer-rank-one-in-odd-selmer-ratio-twists) | retained |

| `ArithmeticStatistics:ST.5/positive-proportions-of-three-selmer-ranks-in-local-subfamilies` | [§5.10 positive proportions of three selmer ranks in local subfamilies](../packages/ArithmeticStatistics/README.md#positive-proportions-of-three-selmer-ranks-in-local-subfamilies) | retained |

| `ArithmeticStatistics:ST.5/cm-curves-have-a-twist-with-good-reduction` | [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction) | retained |

| `ArithmeticStatistics:ST.5/cm-three-isogeny-has-selmer-ratio-one` | [§5.11 cm three isogeny has selmer ratio one](../packages/ArithmeticStatistics/README.md#cm-three-isogeny-has-selmer-ratio-one) | retained |

| `ArithmeticStatistics:ST.5/cm-twists-have-corank-zero-at-least-half` | [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half) | retained |

| `ArithmeticStatistics:ST.5/coefficient-vector-form` | [§0.10 coefficient vector form](../packages/ArithmeticStatistics/README.md#coefficient-vector-form) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/local-density-of-a-form-modulo-q` | [§0.10 local density of a form modulo q](../packages/ArithmeticStatistics/README.md#local-density-of-a-form-modulo-q) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/polynomial-congruence-under-perturbation` | [§5.12 polynomial congruence under perturbation](../packages/ArithmeticStatistics/README.md#polynomial-congruence-under-perturbation) | retained |

| `ArithmeticStatistics:ST.5/first-order-taylor-congruence` | [§5.12 first order taylor congruence](../packages/ArithmeticStatistics/README.md#first-order-taylor-congruence) | retained |

| `ArithmeticStatistics:ST.5/local-density-first-moment` | [§5.12 local density first moment](../packages/ArithmeticStatistics/README.md#local-density-first-moment) | retained |

| `ArithmeticStatistics:ST.5/two-point-incidence-count` | [§5.12 two point incidence count](../packages/ArithmeticStatistics/README.md#two-point-incidence-count) | retained |

| `ArithmeticStatistics:ST.5/veronese-minor-valuation` | [§5.12 veronese minor valuation](../packages/ArithmeticStatistics/README.md#veronese-minor-valuation) | retained |

| `ArithmeticStatistics:ST.5/primitive-pair-minor-gcd-sum` | [§5.12 primitive pair minor gcd sum](../packages/ArithmeticStatistics/README.md#primitive-pair-minor-gcd-sum) | retained |

| `ArithmeticStatistics:ST.5/local-density-second-moment` | [§5.12 local density second moment](../packages/ArithmeticStatistics/README.md#local-density-second-moment) | retained |

| `ArithmeticStatistics:ST.5/local-density-variance` | [§5.12 local density variance](../packages/ArithmeticStatistics/README.md#local-density-variance) | retained |

| `ArithmeticStatistics:ST.5/gradient-valuation-strata` | [§5.12 gradient valuation strata](../packages/ArithmeticStatistics/README.md#gradient-valuation-strata) | retained |

| `ArithmeticStatistics:ST.5/high-gradient-stratum-count` | [§5.12 high gradient stratum count](../packages/ArithmeticStatistics/README.md#high-gradient-stratum-count) | retained |

| `ArithmeticStatistics:ST.5/fixed-gradient-valuation-hensel-lifting` | [§5.12 fixed gradient valuation hensel lifting](../packages/ArithmeticStatistics/README.md#fixed-gradient-valuation-hensel-lifting) | retained |

| `ArithmeticStatistics:ST.5/local-density-lower-bound-on-gradient-stratum` | [§5.12 local density lower bound on gradient stratum](../packages/ArithmeticStatistics/README.md#local-density-lower-bound-on-gradient-stratum) | retained |

| `ArithmeticStatistics:ST.5/convex-concentration-inequality` | [§5.13 convex concentration inequality](../packages/ArithmeticStatistics/README.md#convex-concentration-inequality) | retained |

| `ArithmeticStatistics:ST.5/weighted-square-concentration` | [§5.13 weighted square concentration](../packages/ArithmeticStatistics/README.md#weighted-square-concentration) | retained |

| `ArithmeticStatistics:ST.5/model-ring-orbit-count-concentration` | [§5.13 model ring orbit count concentration](../packages/ArithmeticStatistics/README.md#model-ring-orbit-count-concentration) | retained |

| `ArithmeticStatistics:ST.5/most-ppavs-have-a-large-elliptic-or-real-weil-factor` | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor) | retained |

| `ArithmeticStatistics:ST.5/kolmogorov-distance` | [§5.14 kolmogorov distance](../packages/ArithmeticStatistics/README.md#kolmogorov-distance) | retained |

| `ArithmeticStatistics:ST.5/normalized-eigenangle-spacing-measure` | [§5.14 normalized eigenangle spacing measure](../packages/ArithmeticStatistics/README.md#normalized-eigenangle-spacing-measure) | retained |

| `ArithmeticStatistics:ST.5/zero-gap-mass-from-repeated-angles` | [§5.14 zero gap mass from repeated angles](../packages/ArithmeticStatistics/README.md#zero-gap-mass-from-repeated-angles) | retained |

| `ArithmeticStatistics:ST.5/kolmogorov-distance-lower-bound-from-an-atom` | [§5.14 kolmogorov distance lower bound from an atom](../packages/ArithmeticStatistics/README.md#kolmogorov-distance-lower-bound-from-an-atom) | retained |

| `ArithmeticStatistics:ST.5/spacing-measure-discrepancy-for-ppavs` | [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs) | retained |

| `ArithmeticStatistics:ST.5/enhanced-cohen-lenstra-fails-for-ppavs` | [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) | retained |

| `ArithmeticStatistics:ST.5/odd-degree-quadratic-function-field-family` | [§0.11 odd degree quadratic function field family](../packages/ArithmeticStatistics/README.md#odd-degree-quadratic-function-field-family) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/size-of-the-odd-degree-quadratic-family` | [§0.11 size of the odd degree quadratic family](../packages/ArithmeticStatistics/README.md#size-of-the-odd-degree-quadratic-family) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/imaginary-exact-slice-parametrization` | [§0.20 imaginary exact slice parametrization](../packages/ArithmeticStatistics/README.md#imaginary-exact-slice-parametrization) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/real-exact-slice-parametrization` | [§0.20 real exact slice parametrization](../packages/ArithmeticStatistics/README.md#real-exact-slice-parametrization) | retained; layer 5→0 |

| `ArithmeticStatistics:ST.5/generalized-dihedral-cover-datum` | [§5.15 generalized dihedral cover datum](../packages/ArithmeticStatistics/README.md#generalized-dihedral-cover-datum) | retained |

| `ArithmeticStatistics:ST.5/class-group-surjection-pair` | [§5.15 class group surjection pair](../packages/ArithmeticStatistics/README.md#class-group-surjection-pair) | retained |

| `ArithmeticStatistics:ST.5/involution-quotient-of-the-unramified-pro-l-group` | [§5.15 involution quotient of the unramified pro l group](../packages/ArithmeticStatistics/README.md#involution-quotient-of-the-unramified-pro-l-group) | retained |

| `ArithmeticStatistics:ST.5/hurwitz-points-classify-class-group-surjections` | [§5.15 hurwitz points classify class group surjections](../packages/ArithmeticStatistics/README.md#hurwitz-points-classify-class-group-surjections) | retained |

| `ArithmeticStatistics:ST.5/factor-two-point-count-identity` | [§5.15 factor two point count identity](../packages/ArithmeticStatistics/README.md#factor-two-point-count-identity) | retained |

| `ArithmeticStatistics:ST.5/empirical-l-primary-class-group-law` | [§5.15 empirical l primary class group law](../packages/ArithmeticStatistics/README.md#empirical-l-primary-class-group-law) | retained |

| `ArithmeticStatistics:ST.5/lower-and-upper-degree-densities` | [§5.15 lower and upper degree densities](../packages/ArithmeticStatistics/README.md#lower-and-upper-degree-densities) | retained |

| `ArithmeticStatistics:ST.5/top-cohomology-counts-rational-components` | [§5.16 top cohomology counts rational components](../packages/ArithmeticStatistics/README.md#top-cohomology-counts-rational-components) | retained |

| `ArithmeticStatistics:ST.5/uniform-trace-error-estimate` | [§5.16 uniform trace error estimate](../packages/ArithmeticStatistics/README.md#uniform-trace-error-estimate) | retained |

| `ArithmeticStatistics:ST.5/uniform-function-field-surjection-moment-estimate` | [§5.19 uniform function field surjection moment estimate](../packages/ArithmeticStatistics/README.md#uniform-function-field-surjection-moment-estimate) | retained |

| `ArithmeticStatistics:ST.5/large-q-cohen-lenstra-theorem` | [§5.19 large q cohen lenstra theorem](../packages/ArithmeticStatistics/README.md#large-q-cohen-lenstra-theorem) | retained |

| `ArithmeticStatistics:ST.5/positive-proportions-of-l-divisible-and-indivisible-class-numbers` | [§5.19 positive proportions of l divisible and indivisible class numbers](../packages/ArithmeticStatistics/README.md#positive-proportions-of-l-divisible-and-indivisible-class-numbers) | retained |

| `ArithmeticStatistics:ST.5/hyperelliptic-torsion-local-system` | [§5.17 hyperelliptic torsion local system](../packages/ArithmeticStatistics/README.md#hyperelliptic-torsion-local-system) | retained |

| `ArithmeticStatistics:ST.5/geometric-generic-fibre-of-the-unmarked-hurwitz-cover` | [§5.17 geometric generic fibre of the unmarked hurwitz cover](../packages/ArithmeticStatistics/README.md#geometric-generic-fibre-of-the-unmarked-hurwitz-cover) | retained |

| `ArithmeticStatistics:ST.5/hyperelliptic-boundary-degeneration` | [§5.17 hyperelliptic boundary degeneration](../packages/ArithmeticStatistics/README.md#hyperelliptic-boundary-degeneration) | retained |

| `ArithmeticStatistics:ST.5/overlapping-symplectic-subgroups-generate` | [§5.17 overlapping symplectic subgroups generate](../packages/ArithmeticStatistics/README.md#overlapping-symplectic-subgroups-generate) | retained |

| `ArithmeticStatistics:ST.5/mod-l-hyperelliptic-monodromy-is-symplectic` | [§5.17 mod l hyperelliptic monodromy is symplectic](../packages/ArithmeticStatistics/README.md#mod-l-hyperelliptic-monodromy-is-symplectic) | retained |

| `ArithmeticStatistics:ST.5/integral-lift-of-full-mod-l-symplectic-image` | [§5.17 integral lift of full mod l symplectic image](../packages/ArithmeticStatistics/README.md#integral-lift-of-full-mod-l-symplectic-image) | retained |

| `ArithmeticStatistics:ST.5/integral-hyperelliptic-monodromy` | [§5.17 integral hyperelliptic monodromy](../packages/ArithmeticStatistics/README.md#integral-hyperelliptic-monodromy) | retained |

| `ArithmeticStatistics:ST.5/monodromy-of-the-odd-degree-polynomial-family` | [§5.17 monodromy of the odd degree polynomial family](../packages/ArithmeticStatistics/README.md#monodromy-of-the-odd-degree-polynomial-family) | retained |

| `ArithmeticStatistics:ST.5/finite-level-monodromy-of-the-polynomial-family` | [§5.17 finite level monodromy of the polynomial family](../packages/ArithmeticStatistics/README.md#finite-level-monodromy-of-the-polynomial-family) | retained |

| `ArithmeticStatistics:ST.5/symplectic-similitude-group` | [§5.18 symplectic similitude group](../packages/ArithmeticStatistics/README.md#symplectic-similitude-group) | retained |

| `ArithmeticStatistics:ST.5/monodromy-orbits-and-rational-components` | [§5.18 monodromy orbits and rational components](../packages/ArithmeticStatistics/README.md#monodromy-orbits-and-rational-components) | retained |

| `ArithmeticStatistics:ST.5/primary-decomposition-for-a-multiplier-q-similitude` | [§5.18 primary decomposition for a multiplier q similitude](../packages/ArithmeticStatistics/README.md#primary-decomposition-for-a-multiplier-q-similitude) | retained |

| `ArithmeticStatistics:ST.5/orthogonality-and-a-killed-lagrangian` | [§5.18 orthogonality and a killed lagrangian](../packages/ArithmeticStatistics/README.md#orthogonality-and-a-killed-lagrangian) | retained |

| `ArithmeticStatistics:ST.5/symplectic-normal-forms-over-z-l` | [§5.18 symplectic normal forms over z l](../packages/ArithmeticStatistics/README.md#symplectic-normal-forms-over-z-l) | retained |

| `ArithmeticStatistics:ST.5/linear-group-transitive-on-lattice-surjections` | [§5.18 linear group transitive on lattice surjections](../packages/ArithmeticStatistics/README.md#linear-group-transitive-on-lattice-surjections) | retained |

| `ArithmeticStatistics:ST.5/unique-similitude-stable-symplectic-orbit` | [§5.18 unique similitude stable symplectic orbit](../packages/ArithmeticStatistics/README.md#unique-similitude-stable-symplectic-orbit) | retained |

| `ArithmeticStatistics:ST.5/one-rational-geometric-component` | [§5.18 one rational geometric component](../packages/ArithmeticStatistics/README.md#one-rational-geometric-component) | retained |

| `ArithmeticStatistics:ST.5/eventual-degree-large-q-limit` | [§5.20 eventual degree large q limit](../packages/ArithmeticStatistics/README.md#eventual-degree-large-q-limit) | retained |

| `ArithmeticStatistics:ST.5/imaginary-per-component-unit-moment` | [§5.20 imaginary per component unit moment](../packages/ArithmeticStatistics/README.md#imaginary-per-component-unit-moment) | retained |

| `ArithmeticStatistics:ST.5/real-per-component-unit-moment` | [§5.20 real per component unit moment](../packages/ArithmeticStatistics/README.md#real-per-component-unit-moment) | retained |

| `ArithmeticStatistics:ST.5/imaginary-normalized-nonabelian-moment` | [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment) | retained |

| `ArithmeticStatistics:ST.5/real-normalized-nonabelian-moment` | [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment) | retained |

| `ArithmeticStatistics:ST.5/stable-parity-multidegree-count` | [§5.21 stable parity multidegree count](../packages/ArithmeticStatistics/README.md#stable-parity-multidegree-count) | retained |

| `ArithmeticStatistics:ST.5/many-large-parity-vectors` | [§5.21 many large parity vectors](../packages/ArithmeticStatistics/README.md#many-large-parity-vectors) | retained |

| `ArithmeticStatistics:ST.5/bad-type-lower-bound` | [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound) | retained |

| `ArithmeticStatistics:ST.5/bad-type-normalization-transfer` | [§5.21 bad type normalization transfer](../packages/ArithmeticStatistics/README.md#bad-type-normalization-transfer) | retained |

| `ArithmeticStatistics:ST.5/printed-bad-type-ordinary-limit-assertion` | [§5.21 printed bad type ordinary limit assertion](../packages/ArithmeticStatistics/README.md#printed-bad-type-ordinary-limit-assertion) | retained |

| `ArithmeticStatistics:ST.5/whole-fixed-degree-component-profile` | [§5.21 whole fixed degree component profile](../packages/ArithmeticStatistics/README.md#whole-fixed-degree-component-profile) | retained |

| `ArithmeticStatistics:ST.5/boundary-component-remainder` | [§5.21 boundary component remainder](../packages/ArithmeticStatistics/README.md#boundary-component-remainder) | retained |

| `ArithmeticStatistics:ST.5/complete-stable-range-component-sum` | [§5.21 complete stable range component sum](../packages/ArithmeticStatistics/README.md#complete-stable-range-component-sum) | retained |

| `ArithmeticStatistics:ST.5/moment-minus-component-profile-vanishes` | [§5.21 moment minus component profile vanishes](../packages/ArithmeticStatistics/README.md#moment-minus-component-profile-vanishes) | retained |

| `ArithmeticStatistics:ST.5/ordinary-limit-iff-eventual-profile-constancy` | [§5.21 ordinary limit iff eventual profile constancy](../packages/ArithmeticStatistics/README.md#ordinary-limit-iff-eventual-profile-constancy) | retained |

| `ArithmeticStatistics:ST.5/liminf-limsup-from-recurrent-profile-values` | [§5.21 liminf limsup from recurrent profile values](../packages/ArithmeticStatistics/README.md#liminf-limsup-from-recurrent-profile-values) | retained |

| `ArithmeticStatistics:ST.5/weight-polynomial-formula-for-the-stable-orthant` | [§5.21 weight polynomial formula for the stable orthant](../packages/ArithmeticStatistics/README.md#weight-polynomial-formula-for-the-stable-orthant) | retained |

| `ArithmeticStatistics:ST.5/surjections-onto-a-semidirect-product` | [§5.22 surjections onto a semidirect product](../packages/ArithmeticStatistics/README.md#surjections-onto-a-semidirect-product) | retained |

| `ArithmeticStatistics:ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate` | [§5.22 complements of a coprime abelian normal subgroup are conjugate](../packages/ArithmeticStatistics/README.md#complements-of-a-coprime-abelian-normal-subgroup-are-conjugate) | retained |

| `ArithmeticStatistics:ST.5/counting-unramified-h-extensions-via-semidirect-extensions` | [§5.22 counting unramified h extensions via semidirect extensions](../packages/ArithmeticStatistics/README.md#counting-unramified-h-extensions-via-semidirect-extensions) | retained |

| `ArithmeticStatistics:ST.5/liu-wood-zureick-brown-function-field-moments` | [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) | retained |

| `ArithmeticStatistics:ST.5/cohen-lenstra-martinet-moments-over-function-fields` | [§5.22 cohen lenstra martinet moments over function fields](../packages/ArithmeticStatistics/README.md#cohen-lenstra-martinet-moments-over-function-fields) | retained |

| `ArithmeticStatistics:ST.5/symmetric-image-obstruction` | [§3.16 symmetric image obstruction](../packages/ArithmeticStatistics/README.md#symmetric-image-obstruction) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-border-rank-in-image` | [§3.16 symmetric border rank in image](../packages/ArithmeticStatistics/README.md#symmetric-border-rank-in-image) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-border-rank-outside-image` | [§3.16 symmetric border rank outside image](../packages/ArithmeticStatistics/README.md#symmetric-border-rank-outside-image) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-border-rank-fibers` | [§3.16 symmetric border rank fibers](../packages/ArithmeticStatistics/README.md#symmetric-border-rank-fibers) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-rank-count-recurrence` | [§3.16 symmetric rank count recurrence](../packages/ArithmeticStatistics/README.md#symmetric-rank-count-recurrence) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/symmetric-rank-product-recurrence` | [§3.16 symmetric rank product recurrence](../packages/ArithmeticStatistics/README.md#symmetric-rank-product-recurrence) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.0/coefficient-box` | [§0.12 coefficient box](../packages/ArithmeticStatistics/README.md#coefficient-box) | retained |

| `ArithmeticStatistics:ST.0/monic-weighted-height` | [§0.12 monic weighted height](../packages/ArithmeticStatistics/README.md#monic-weighted-height) | retained |

| `ArithmeticStatistics:ST.0/binary-discriminant` | [§0.12 binary discriminant](../packages/ArithmeticStatistics/README.md#binary-discriminant) | retained |

| `ArithmeticStatistics:ST.0/binary-local-proportion` | [§0.12 binary local proportion](../packages/ArithmeticStatistics/README.md#binary-local-proportion) | retained |

| `ArithmeticStatistics:ST.0/monic-local-proportions` | [§0.12 monic local proportions](../packages/ArithmeticStatistics/README.md#monic-local-proportions) | retained |

| `ArithmeticStatistics:ST.0/strong-weak-discriminant` | [§0.12 strong weak discriminant](../packages/ArithmeticStatistics/README.md#strong-weak-discriminant) | retained |

| `ArithmeticStatistics:ST.0/stickelberger-binary` | [§0.23 stickelberger binary](../packages/ArithmeticStatistics/README.md#stickelberger-binary) | retained |

| `ArithmeticStatistics:ST.0/monic-density-formulas` | [§0.23 monic density formulas](../packages/ArithmeticStatistics/README.md#monic-density-formulas) | retained |

| `ArithmeticStatistics:ST.0/local-maximality` | [§0.12 local maximality](../packages/ArithmeticStatistics/README.md#local-maximality) | retained |

| `ArithmeticStatistics:ST.0/binary-density-formulas` | [§1.9 binary density formulas](../packages/ArithmeticStatistics/README.md#binary-density-formulas) | retained; layer 0→1 |

| `ArithmeticStatistics:ST.0/kappa-acceptable-specifications` | [§0.12 kappa acceptable specifications](../packages/ArithmeticStatistics/README.md#kappa-acceptable-specifications) | retained |

| `ArithmeticStatistics:ST.0/primitive-hypersurface-family` | [§0.13 primitive hypersurface family](../packages/ArithmeticStatistics/README.md#primitive-hypersurface-family) | retained |

| `ArithmeticStatistics:ST.0/finite-local-hypersurface-set` | [§0.13 finite local hypersurface set](../packages/ArithmeticStatistics/README.md#finite-local-hypersurface-set) | retained |

| `ArithmeticStatistics:ST.0/hyperelliptic-model-family` | [§0.14 hyperelliptic model family](../packages/ArithmeticStatistics/README.md#hyperelliptic-model-family) | retained |

| `ArithmeticStatistics:ST.0/odd-root-criterion` | [§0.14 odd root criterion](../packages/ArithmeticStatistics/README.md#odd-root-criterion) | retained |

| `ArithmeticStatistics:ST.0/density-denominator-comparisons` | [§0.14 density denominator comparisons](../packages/ArithmeticStatistics/README.md#density-denominator-comparisons) | retained |

| `ArithmeticStatistics:ST.0/negative-pell-radicands` | [§0.15 negative pell radicands](../packages/ArithmeticStatistics/README.md#negative-pell-radicands) | retained |

| `ArithmeticStatistics:ST.0/field-permutation-type` | Scope: TauCetiRoadmap.PolynomialGaloisGroups Layers 0, 2 and 6 (the native permutation-action predicate) | native deferral |

| `ArithmeticStatistics:ST.0/twist-denominator-frontier` | [§0.15 positive squareclass denominator](../packages/ArithmeticStatistics/README.md#twist-denominator-frontier) | retained |

| `ArithmeticStatistics:ST.0/unpolarized-abelian-count` | [§0.16 unpolarized abelian count](../packages/ArithmeticStatistics/README.md#unpolarized-abelian-count) | retained |

| `ArithmeticStatistics:ST.0/principally-polarized-count` | [§0.16 principally polarized count](../packages/ArithmeticStatistics/README.md#principally-polarized-count) | retained |

| `ArithmeticStatistics:ST.0/polarization-fiber-count` | [§0.16 polarization fiber count](../packages/ArithmeticStatistics/README.md#polarization-fiber-count) | retained |

| `ArithmeticStatistics:ST.0/natural-bundle-law` | [§0.17 natural bundle law](../packages/ArithmeticStatistics/README.md#natural-bundle-law) | retained |

| `ArithmeticStatistics:ST.0/bundle-parity-tails` | [§0.17 bundle parity tails](../packages/ArithmeticStatistics/README.md#bundle-parity-tails) | retained |

| `ArithmeticStatistics:ST.0/finite-picard-quotient` | [§0.18 finite picard quotient](../packages/ArithmeticStatistics/README.md#finite-picard-quotient) | retained |

| `ArithmeticStatistics:ST.0/picard-representatives-and-carry` | [§0.18 picard representatives and carry](../packages/ArithmeticStatistics/README.md#picard-representatives-and-carry) | retained |

| `ArithmeticStatistics:ST.0/finite-joint-bundle-mass` | [§0.18 finite joint bundle mass](../packages/ArithmeticStatistics/README.md#finite-joint-bundle-mass) | retained |

| `ArithmeticStatistics:ST.0/theta-tail-normalization` | [§0.18 theta tail normalization](../packages/ArithmeticStatistics/README.md#theta-tail-normalization) | retained |

| `ArithmeticStatistics:ST.0/parity-product-candidate` | [§0.18 parity product candidate](../packages/ArithmeticStatistics/README.md#parity-product-candidate) | retained |

| `ArithmeticStatistics:ST.0/hecke-pushforward` | [§0.18 hecke pushforward](../packages/ArithmeticStatistics/README.md#hecke-pushforward) | retained |

| `ArithmeticStatistics:ST.0/pointless-curve-regression` | [§0.18 pointless curve regression](../packages/ArithmeticStatistics/README.md#pointless-curve-regression) | retained |

| `ArithmeticStatistics:ST.0/wood-outside-involutions` | [§0.19 wood outside involutions](../packages/ArithmeticStatistics/README.md#wood-outside-involutions) | retained |

| `ArithmeticStatistics:ST.0/wood-admissible-type` | [§0.19 wood admissible type](../packages/ArithmeticStatistics/README.md#wood-admissible-type) | retained |

| `ArithmeticStatistics:ST.0/wood-good-type` | [§0.19 wood good type](../packages/ArithmeticStatistics/README.md#wood-good-type) | retained |

| `ArithmeticStatistics:ST.0/wood-type-automorphisms` | [§0.19 wood type automorphisms](../packages/ArithmeticStatistics/README.md#wood-type-automorphisms) | retained |

| `ArithmeticStatistics:ST.0/wood-continuous-surjections` | [§0.19 wood continuous surjections](../packages/ArithmeticStatistics/README.md#wood-continuous-surjections) | retained |

| `ArithmeticStatistics:ST.0/wood-infinity-and-type-adapter` | [§0.19 wood infinity and type adapter](../packages/ArithmeticStatistics/README.md#wood-infinity-and-type-adapter) | retained |

| `ArithmeticStatistics:ST.0/wood-average-normalizations` | [§0.21 wood average normalizations](../packages/ArithmeticStatistics/README.md#wood-average-normalizations) | retained |

| `ArithmeticStatistics:ST.0/wood-root-unity-and-tame-comparison` | [§0.21 wood root unity and tame comparison](../packages/ArithmeticStatistics/README.md#wood-root-unity-and-tame-comparison) | retained |

| `ArithmeticStatistics:ST.0/monic-euler-products` | [§0.24 monic euler products](../packages/ArithmeticStatistics/README.md#monic-euler-products) | retained |

| `ArithmeticStatistics:ST.1/refinement-quartic-minors` | [§1.8 quartic minors](../packages/ArithmeticStatistics/README.md#refinement-quartic-minors) | retained |

| `ArithmeticStatistics:ST.1/refinement-integral-minor-fibres` | [§1.8 integral minor fibres](../packages/ArithmeticStatistics/README.md#refinement-integral-minor-fibres) | retained |

| `ArithmeticStatistics:ST.1/refinement-quintic-multiplication` | [§1.10 quintic multiplication](../packages/ArithmeticStatistics/README.md#refinement-quintic-multiplication) | retained |

| `ArithmeticStatistics:ST.1/refinement-sextic-multiplication` | [§1.10 sextic multiplication](../packages/ArithmeticStatistics/README.md#refinement-sextic-multiplication) | retained |

| `ArithmeticStatistics:ST.1/refinement-based-sextic-resolvent` | [§1.10 based sextic resolvent](../packages/ArithmeticStatistics/README.md#refinement-based-sextic-resolvent) | retained |

| `ArithmeticStatistics:ST.1/refinement-nondegenerate-resolvent-comparison` | [§1.10 nondegenerate resolvent comparison](../packages/ArithmeticStatistics/README.md#refinement-nondegenerate-resolvent-comparison) | retained |

| `ArithmeticStatistics:ST.1/refinement-integral-quintic-realization` | [§1.10 integral quintic realization](../packages/ArithmeticStatistics/README.md#refinement-integral-quintic-realization) | retained |

| `ArithmeticStatistics:ST.1/refinement-quintic-minimal-model` | [§1.10 quintic minimal model](../packages/ArithmeticStatistics/README.md#refinement-quintic-minimal-model) | retained |

| `ArithmeticStatistics:ST.1/refinement-monogenized-resolvent` | [§1.11 monogenized resolvent](../packages/ArithmeticStatistics/README.md#refinement-monogenized-resolvent) | retained |

| `ArithmeticStatistics:ST.1/refinement-wood-ring-interpretation` | [§1.11 wood ring interpretation](../packages/ArithmeticStatistics/README.md#refinement-wood-ring-interpretation) | retained |

| `ArithmeticStatistics:ST.1/refinement-symmetric-pencil` | [§0.22 symmetric pencil](../packages/ArithmeticStatistics/README.md#refinement-symmetric-pencil) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/refinement-binary-discriminant` | [§0.22 binary discriminant](../packages/ArithmeticStatistics/README.md#refinement-binary-discriminant) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/refinement-common-isotropic` | [§1.12 common isotropic](../packages/ArithmeticStatistics/README.md#refinement-common-isotropic) | retained |

| `ArithmeticStatistics:ST.1/refinement-binary-form-order` | [§0.22 binary form order](../packages/ArithmeticStatistics/README.md#refinement-binary-form-order) | retained; layer 1→0 |

| `ArithmeticStatistics:ST.1/refinement-oriented-ideal-triples` | [§1.12 oriented ideal triples](../packages/ArithmeticStatistics/README.md#refinement-oriented-ideal-triples) | retained |

| `ArithmeticStatistics:ST.1/refinement-integral-pencil-orbits` | [§1.12 integral pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-integral-pencil-orbits) | retained |

| `ArithmeticStatistics:ST.1/refinement-oriented-norm-pairs` | [§1.12 oriented norm pairs](../packages/ArithmeticStatistics/README.md#refinement-oriented-norm-pairs) | retained |

| `ArithmeticStatistics:ST.1/refinement-field-pencil-stabilizers` | [§1.12 field pencil stabilizers](../packages/ArithmeticStatistics/README.md#refinement-field-pencil-stabilizers) | retained |

| `ArithmeticStatistics:ST.1/refinement-pencil-existence` | [§1.12 pencil existence](../packages/ArithmeticStatistics/README.md#refinement-pencil-existence) | retained |

| `ArithmeticStatistics:ST.1/refinement-pencil-fano-torsor` | [§1.12 pencil fano torsor](../packages/ArithmeticStatistics/README.md#refinement-pencil-fano-torsor) | retained |

| `ArithmeticStatistics:ST.1/refinement-locally-soluble-pencil-orbits` | [§1.12 locally soluble pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-locally-soluble-pencil-orbits) | retained |

| `ArithmeticStatistics:ST.1/refinement-integral-soluble-pencils` | [§1.12 integral soluble pencils](../packages/ArithmeticStatistics/README.md#refinement-integral-soluble-pencils) | retained |

| `ArithmeticStatistics:ST.1/refinement-weak-discriminant-divisibility` | [§1.13 weak discriminant divisibility](../packages/ArithmeticStatistics/README.md#refinement-weak-discriminant-divisibility) | retained |

| `ArithmeticStatistics:ST.1/refinement-q-hyperdeterminant` | [§1.13 q hyperdeterminant](../packages/ArithmeticStatistics/README.md#refinement-q-hyperdeterminant) | retained |

| `ArithmeticStatistics:ST.1/refinement-q-discriminant-divisibility` | [§1.13 q discriminant divisibility](../packages/ArithmeticStatistics/README.md#refinement-q-discriminant-divisibility) | retained |

| `ArithmeticStatistics:ST.1/refinement-marked-q` | [§1.13 marked q](../packages/ArithmeticStatistics/README.md#refinement-marked-q) | retained |

| `ArithmeticStatistics:ST.1/refinement-weak-lift-odd` | [§1.13 weak lift odd](../packages/ArithmeticStatistics/README.md#refinement-weak-lift-odd) | retained |

| `ArithmeticStatistics:ST.1/refinement-one-matrix-slice` | [§1.13 one matrix slice](../packages/ArithmeticStatistics/README.md#refinement-one-matrix-slice) | retained |

| `ArithmeticStatistics:ST.1/refinement-even-weak-lift` | [§1.13 even weak lift](../packages/ArithmeticStatistics/README.md#refinement-even-weak-lift) | retained |

| `ArithmeticStatistics:ST.1/refinement-genus-one-stabilizer-schemes` | [§1.14 genus one stabilizer schemes](../packages/ArithmeticStatistics/README.md#refinement-genus-one-stabilizer-schemes) | retained |

| `ArithmeticStatistics:ST.1/refinement-quartic-invariant-index` | [§1.15 quartic invariant index](../packages/ArithmeticStatistics/README.md#refinement-quartic-invariant-index) | retained |

| `ArithmeticStatistics:ST.1/refinement-quartic-etale-resolvent` | [§1.15 quartic etale resolvent](../packages/ArithmeticStatistics/README.md#refinement-quartic-etale-resolvent) | retained |

| `ArithmeticStatistics:ST.1/refinement-good-prime-integral-pencils` | [§1.16 good prime integral pencils](../packages/ArithmeticStatistics/README.md#refinement-good-prime-integral-pencils) | retained |

| `ArithmeticStatistics:ST.2/refinement-quartic-finite-congruence-count` | [§2.8 quartic finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-quartic-finite-congruence-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quartic-fixed-reducible-resolvent` | [§2.8 quartic fixed reducible resolvent](../packages/ArithmeticStatistics/README.md#refinement-quartic-fixed-reducible-resolvent) | retained |

| `ArithmeticStatistics:ST.2/refinement-quartic-nonmaximal-overramified-tail` | [§2.8 quartic nonmaximal overramified tail](../packages/ArithmeticStatistics/README.md#refinement-quartic-nonmaximal-overramified-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-quintic-finite-congruence-count` | [§2.9 quintic finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-quintic-finite-congruence-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quintic-nonmaximal-tail` | [§2.9 quintic nonmaximal tail](../packages/ArithmeticStatistics/README.md#refinement-quintic-nonmaximal-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-global-field-generic-finite-count` | [§2.10 global field generic finite count](../packages/ArithmeticStatistics/README.md#refinement-global-field-generic-finite-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-global-field-large-prime-tail` | [§2.10 global field large prime tail](../packages/ArithmeticStatistics/README.md#refinement-global-field-large-prime-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-global-field-large-local-count` | [§2.10 global field large local count](../packages/ArithmeticStatistics/README.md#refinement-global-field-large-local-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-cubic-secondary-congruence-count` | [§2.11 cubic secondary congruence count](../packages/ArithmeticStatistics/README.md#refinement-cubic-secondary-congruence-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-cubic-secondary-sieve-error` | [§2.11 cubic secondary sieve error](../packages/ArithmeticStatistics/README.md#refinement-cubic-secondary-sieve-error) | retained |

| `ArithmeticStatistics:ST.2/refinement-square-divisor-tail` | [§2.12 square divisor tail](../packages/ArithmeticStatistics/README.md#refinement-square-divisor-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-kappa-acceptable` | [§2.12 kappa acceptable](../packages/ArithmeticStatistics/README.md#refinement-kappa-acceptable) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-rational-root-bound` | [§2.13 monic rational root bound](../packages/ArithmeticStatistics/README.md#refinement-monic-rational-root-bound) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-extra-reducible-bound` | [§2.13 monic extra reducible bound](../packages/ArithmeticStatistics/README.md#refinement-monic-extra-reducible-bound) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-distinguished-off-block` | [§2.13 monic distinguished off block](../packages/ArithmeticStatistics/README.md#refinement-monic-distinguished-off-block) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-q-cusp-tail` | [§2.13 monic q cusp tail](../packages/ArithmeticStatistics/README.md#refinement-monic-q-cusp-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-strong-tail` | [§2.13 monic strong tail](../packages/ArithmeticStatistics/README.md#refinement-monic-strong-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-weak-tail` | [§2.13 monic weak tail](../packages/ArithmeticStatistics/README.md#refinement-monic-weak-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-summed-tail` | [§2.13 monic summed tail](../packages/ArithmeticStatistics/README.md#refinement-monic-summed-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-monic-fixed-modulus-sieve` | [§2.13 monic fixed modulus sieve](../packages/ArithmeticStatistics/README.md#refinement-monic-fixed-modulus-sieve) | retained |

| `ArithmeticStatistics:ST.2/refinement-invariant-geometric-sieve-criterion` | [§2.14 invariant geometric sieve criterion](../packages/ArithmeticStatistics/README.md#refinement-invariant-geometric-sieve-criterion) | retained |

| `ArithmeticStatistics:ST.2/refinement-binary-strong-tail` | [§2.15 binary strong tail](../packages/ArithmeticStatistics/README.md#refinement-binary-strong-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-odd-binary-cusp-count` | [§2.15 odd binary cusp count](../packages/ArithmeticStatistics/README.md#refinement-odd-binary-cusp-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-odd-binary-weak-tail` | [§2.15 odd binary weak tail](../packages/ArithmeticStatistics/README.md#refinement-odd-binary-weak-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-even-binary-small-discriminant` | [§2.16 even binary small discriminant](../packages/ArithmeticStatistics/README.md#refinement-even-binary-small-discriminant) | retained |

| `ArithmeticStatistics:ST.2/refinement-even-binary-constant-term-tail` | [§2.16 even binary constant term tail](../packages/ArithmeticStatistics/README.md#refinement-even-binary-constant-term-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-even-binary-main-shallow` | [§2.16 even binary main shallow](../packages/ArithmeticStatistics/README.md#refinement-even-binary-main-shallow) | retained |

| `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-gram` | [§2.16 even binary restricted gram](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-gram) | retained |

| `ArithmeticStatistics:ST.2/refinement-even-binary-restricted-deep-tail` | [§2.16 even binary restricted deep tail](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-deep-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-binary-summed-tail` | [§2.16 binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-binary-summed-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-quadratic-binary-summed-tail` | [§2.16 quadratic binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-quadratic-binary-summed-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-binary-fixed-modulus-sieve` | [§2.16 binary fixed modulus sieve](../packages/ArithmeticStatistics/README.md#refinement-binary-fixed-modulus-sieve) | retained |

| `ArithmeticStatistics:ST.2/refinement-pencil-finite-congruence-count` | [§2.17 pencil finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-pencil-finite-congruence-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-pencil-infinite-weight-upper-bound` | [§2.17 pencil infinite weight upper bound](../packages/ArithmeticStatistics/README.md#refinement-pencil-infinite-weight-upper-bound) | retained |

| `ArithmeticStatistics:ST.2/refinement-large-coefficient-family-tail` | [§2.17 large coefficient family tail](../packages/ArithmeticStatistics/README.md#refinement-large-coefficient-family-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-ternary-cubic-finite-count` | [§2.18 ternary cubic finite count](../packages/ArithmeticStatistics/README.md#refinement-ternary-cubic-finite-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-ternary-cubic-prime-tail` | [§2.18 ternary cubic prime tail](../packages/ArithmeticStatistics/README.md#refinement-ternary-cubic-prime-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-ternary-cubic-acceptable-count` | [§2.18 ternary cubic acceptable count](../packages/ArithmeticStatistics/README.md#refinement-ternary-cubic-acceptable-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quaternary-finite-count` | [§2.19 quaternary finite count](../packages/ArithmeticStatistics/README.md#refinement-quaternary-finite-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quaternary-prime-tail` | [§2.19 quaternary prime tail](../packages/ArithmeticStatistics/README.md#refinement-quaternary-prime-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-quaternary-acceptable-count` | [§2.19 quaternary acceptable count](../packages/ArithmeticStatistics/README.md#refinement-quaternary-acceptable-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quinary-finite-count` | [§2.20 quinary finite count](../packages/ArithmeticStatistics/README.md#refinement-quinary-finite-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-quinary-prime-tail` | [§2.20 quinary prime tail](../packages/ArithmeticStatistics/README.md#refinement-quinary-prime-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-quinary-acceptable-count` | [§2.20 quinary acceptable count](../packages/ArithmeticStatistics/README.md#refinement-quinary-acceptable-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-section-kernel` | [§2.21 section kernel](../packages/ArithmeticStatistics/README.md#refinement-section-kernel) | retained |

| `ArithmeticStatistics:ST.2/refinement-smoothed-orbit-unfolding` | [§2.21 smoothed orbit unfolding](../packages/ArithmeticStatistics/README.md#refinement-smoothed-orbit-unfolding) | retained |

| `ArithmeticStatistics:ST.2/refinement-smoothed-quaternary-count` | [§2.21 smoothed quaternary count](../packages/ArithmeticStatistics/README.md#refinement-smoothed-quaternary-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-number-field-twist-orbit-count` | [§2.22 number field twist orbit count](../packages/ArithmeticStatistics/README.md#refinement-number-field-twist-orbit-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-hypersurface-local-tail` | [§2.23 hypersurface local tail](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-local-tail) | retained |

| `ArithmeticStatistics:ST.2/refinement-hypersurface-finite-local-count` | [§2.23 hypersurface finite local count](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-finite-local-count) | retained |

| `ArithmeticStatistics:ST.2/refinement-hypersurface-local-density` | [§2.23 hypersurface local density](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-local-density) | retained |

| `ArithmeticStatistics:ST.3/prime-power-class-group-rank` | [§3.18 prime power class group rank](../packages/ArithmeticStatistics/README.md#prime-power-class-group-rank) | retained |

| `ArithmeticStatistics:ST.3/fk-linking-phase` | [§3.18 fk linking phase](../packages/ArithmeticStatistics/README.md#fk-linking-phase) | retained |

| `ArithmeticStatistics:ST.3/fk-good-subspace-bijection` | [§3.18 fk good subspace bijection](../packages/ArithmeticStatistics/README.md#fk-good-subspace-bijection) | retained |

| `ArithmeticStatistics:ST.3/cubic-conductor-discriminant` | [§3.19 cubic conductor discriminant](../packages/ArithmeticStatistics/README.md#cubic-conductor-discriminant) | retained |

| `ArithmeticStatistics:ST.3/quadratic-order-three-torsion-bound` | [§3.19 quadratic order three torsion bound](../packages/ArithmeticStatistics/README.md#quadratic-order-three-torsion-bound) | retained |

| `ArithmeticStatistics:ST.3/cubic-large-total-ramification-bound` | [§3.19 cubic large total ramification bound](../packages/ArithmeticStatistics/README.md#cubic-large-total-ramification-bound) | retained |

| `ArithmeticStatistics:ST.3/secondary-cubic-lattice-coefficient` | [§3.20 secondary cubic lattice coefficient](../packages/ArithmeticStatistics/README.md#secondary-cubic-lattice-coefficient) | retained |

| `ArithmeticStatistics:ST.3/cubic-secondary-local-factor-evaluation` | [§3.20 cubic secondary local factor evaluation](../packages/ArithmeticStatistics/README.md#cubic-secondary-local-factor-evaluation) | retained |

| `ArithmeticStatistics:ST.3/cubic-root-weighted-sieve-identity` | [§3.20 cubic root weighted sieve identity](../packages/ArithmeticStatistics/README.md#cubic-root-weighted-sieve-identity) | retained |

| `ArithmeticStatistics:ST.3/refined-cubic-sieve` | [§3.20 refined cubic sieve](../packages/ArithmeticStatistics/README.md#refined-cubic-sieve) | retained |

| `ArithmeticStatistics:ST.3/cubic-secondary-orbit-integral` | [§3.20 cubic secondary orbit integral](../packages/ArithmeticStatistics/README.md#cubic-secondary-orbit-integral) | retained |

| `ArithmeticStatistics:ST.3/low-degree-s-integral-parametrization` | [§3.21 low degree s integral parametrization](../packages/ArithmeticStatistics/README.md#low-degree-s-integral-parametrization) | retained |

| `ArithmeticStatistics:ST.3/low-degree-maximal-sieve` | [§3.21 low degree maximal sieve](../packages/ArithmeticStatistics/README.md#low-degree-maximal-sieve) | retained |

| `ArithmeticStatistics:ST.3/low-degree-jacobian-mass` | [§3.21 low degree jacobian mass](../packages/ArithmeticStatistics/README.md#low-degree-jacobian-mass) | retained |

| `ArithmeticStatistics:ST.3/quartic-quintic-density-constants` | [§3.21 quartic quintic density constants](../packages/ArithmeticStatistics/README.md#quartic-quintic-density-constants) | retained |

| `ArithmeticStatistics:ST.3/quartic-class-group-two-torsion-fibre` | [§3.24 quartic class group two torsion fibre](../packages/ArithmeticStatistics/README.md#quartic-class-group-two-torsion-fibre) | retained |

| `ArithmeticStatistics:ST.3/low-degree-class-group-mass-ratios` | [§3.24 low degree class group mass ratios](../packages/ArithmeticStatistics/README.md#low-degree-class-group-mass-ratios) | retained |

| `ArithmeticStatistics:ST.3/quadratic-four-rank-conic-formula` | [§3.22 quadratic four rank conic formula](../packages/ArithmeticStatistics/README.md#quadratic-four-rank-conic-formula) | retained |

| `ArithmeticStatistics:ST.3/quadratic-four-rank-jacobi-expansion` | [§3.22 quadratic four rank jacobi expansion](../packages/ArithmeticStatistics/README.md#quadratic-four-rank-jacobi-expansion) | retained |

| `ArithmeticStatistics:ST.3/fk-maximal-unlinked-support` | [§3.22 fk maximal unlinked support](../packages/ArithmeticStatistics/README.md#fk-maximal-unlinked-support) | retained |

| `ArithmeticStatistics:ST.3/fk-main-coefficient` | [§3.22 fk main coefficient](../packages/ArithmeticStatistics/README.md#fk-main-coefficient) | retained |

| `ArithmeticStatistics:ST.3/fk-narrow-wide-moment-comparison` | [§3.22 fk narrow wide moment comparison](../packages/ArithmeticStatistics/README.md#fk-narrow-wide-moment-comparison) | retained |

| `ArithmeticStatistics:ST.3/rank-moments-determine-rank-law` | [§3.22 rank moments determine rank law](../packages/ArithmeticStatistics/README.md#rank-moments-determine-rank-law) | retained |

| `ArithmeticStatistics:ST.3/rigid-embedded-field-family` | [§3.23 rigid embedded field family](../packages/ArithmeticStatistics/README.md#rigid-embedded-field-family) | retained |

| `ArithmeticStatistics:ST.3/relative-torsion-splitting` | [§3.23 relative torsion splitting](../packages/ArithmeticStatistics/README.md#relative-torsion-splitting) | retained |

| `ArithmeticStatistics:ST.3/uniform-small-degree-field-bound` | [§3.25 uniform small degree field bound](../packages/ArithmeticStatistics/README.md#uniform-small-degree-field-bound) | retained |

| `ArithmeticStatistics:ST.3/shintani-cubic-order-uniform-bound` | [§3.25 shintani cubic order uniform bound](../packages/ArithmeticStatistics/README.md#shintani-cubic-order-uniform-bound) | retained |

| `ArithmeticStatistics:ST.3/relative-three-torsion-propagation` | [§3.25 relative three torsion propagation](../packages/ArithmeticStatistics/README.md#relative-three-torsion-propagation) | retained |

| `ArithmeticStatistics:ST.3/relative-three-torsion-piecewise-bound` | [§3.25 relative three torsion piecewise bound](../packages/ArithmeticStatistics/README.md#relative-three-torsion-piecewise-bound) | retained |

| `ArithmeticStatistics:ST.3/quadratic-tower-torsion-tail` | [§3.25 quadratic tower torsion tail](../packages/ArithmeticStatistics/README.md#quadratic-tower-torsion-tail) | retained |

| `ArithmeticStatistics:ST.3/wreath-transposition-fibre` | [§3.26 wreath transposition fibre](../packages/ArithmeticStatistics/README.md#wreath-transposition-fibre) | retained |

| `ArithmeticStatistics:ST.3/thin-two-group-torsion` | [§3.26 thin two group torsion](../packages/ArithmeticStatistics/README.md#thin-two-group-torsion) | retained |

| `ArithmeticStatistics:ST.3/quadratic-tower-counting-constants` | [§3.26 quadratic tower counting constants](../packages/ArithmeticStatistics/README.md#quadratic-tower-counting-constants) | retained |

| `ArithmeticStatistics:ST.3/two-extension-three-torsion-means` | [§3.26 two extension three torsion means](../packages/ArithmeticStatistics/README.md#two-extension-three-torsion-means) | retained |

| `ArithmeticStatistics:ST.3/relative-wreath-three-torsion-mean` | [§3.26 relative wreath three torsion mean](../packages/ArithmeticStatistics/README.md#relative-wreath-three-torsion-mean) | retained |

| `ArithmeticStatistics:ST.3/embedded-quadratic-wreath-type` | [§3.27 embedded quadratic wreath type](../packages/ArithmeticStatistics/README.md#embedded-quadratic-wreath-type) | retained |

| `ArithmeticStatistics:ST.3/nonabelian-quadratic-moment-interface` | [§3.27 nonabelian quadratic moment interface](../packages/ArithmeticStatistics/README.md#nonabelian-quadratic-moment-interface) | retained |

| `ArithmeticStatistics:ST.3/nonabelian-admissibility-and-abelianization` | [§3.27 nonabelian admissibility and abelianization](../packages/ArithmeticStatistics/README.md#nonabelian-admissibility-and-abelianization) | retained |

| `ArithmeticStatistics:ST.3/embedded-type-catalogue` | [§3.27 embedded type catalogue](../packages/ArithmeticStatistics/README.md#embedded-type-catalogue) | retained |

| `ArithmeticStatistics:ST.3/elementary-two-moment-euler-products` | [§3.27 elementary two moment euler products](../packages/ArithmeticStatistics/README.md#elementary-two-moment-euler-products) | retained |

| `ArithmeticStatistics:ST.3/elementary-two-moment-divergence` | [§3.27 elementary two moment divergence](../packages/ArithmeticStatistics/README.md#elementary-two-moment-divergence) | retained |

| `ArithmeticStatistics:ST.3/nonabelian-low-degree-known-moments` | [§3.27 nonabelian low degree known moments](../packages/ArithmeticStatistics/README.md#nonabelian-low-degree-known-moments) | retained |

| `ArithmeticStatistics:ST.3/a4-appendix-kernel-enumerator` | [§3.27 a4 appendix kernel enumerator](../packages/ArithmeticStatistics/README.md#a4-appendix-kernel-enumerator) | retained |

| `ArithmeticStatistics:ST.3/small-trace-zero-element` | [§3.28 small trace zero element](../packages/ArithmeticStatistics/README.md#small-trace-zero-element) | retained |

| `ArithmeticStatistics:ST.3/schmidt-field-count-bound` | [§3.28 schmidt field count bound](../packages/ArithmeticStatistics/README.md#schmidt-field-count-bound) | retained |

| `ArithmeticStatistics:ST.3/mixed-trace-finite-fibres` | [§3.28 mixed trace finite fibres](../packages/ArithmeticStatistics/README.md#mixed-trace-finite-fibres) | retained |

| `ArithmeticStatistics:ST.3/lemke-oliver-thorne-field-bound` | [§3.28 lemke oliver thorne field bound](../packages/ArithmeticStatistics/README.md#lemke-oliver-thorne-field-bound) | retained |

| `ArithmeticStatistics:ST.3/cyclic-prime-field-count` | [§3.29 cyclic prime field count](../packages/ArithmeticStatistics/README.md#cyclic-prime-field-count) | retained |

| `ArithmeticStatistics:ST.3/galois-field-three-eighths-bound` | [§3.29 galois field three eighths bound](../packages/ArithmeticStatistics/README.md#galois-field-three-eighths-bound) | retained |

| `ArithmeticStatistics:ST.3/fixed-resolvent-cubic-count` | [§3.29 fixed resolvent cubic count](../packages/ArithmeticStatistics/README.md#fixed-resolvent-cubic-count) | retained |

| `ArithmeticStatistics:ST.3/baily-weighted-quartic-count` | [§3.29 baily weighted quartic count](../packages/ArithmeticStatistics/README.md#baily-weighted-quartic-count) | retained |

| `ArithmeticStatistics:ST.3/weighted-cubic-partial-summation` | [§3.29 weighted cubic partial summation](../packages/ArithmeticStatistics/README.md#weighted-cubic-partial-summation) | retained |

| `ArithmeticStatistics:ST.3/quartic-torsion-counting-applications` | [§3.29 quartic torsion counting applications](../packages/ArithmeticStatistics/README.md#quartic-torsion-counting-applications) | retained |

| `ArithmeticStatistics:ST.3/governing-field-interface` | [§3.30 governing field interface](../packages/ArithmeticStatistics/README.md#governing-field-interface) | retained |

| `ArithmeticStatistics:ST.3/eight-rank-governing-field` | [§3.30 eight rank governing field](../packages/ArithmeticStatistics/README.md#eight-rank-governing-field) | retained |

| `ArithmeticStatistics:ST.3/sixteen-rank-spin-criterion` | [§3.30 sixteen rank spin criterion](../packages/ArithmeticStatistics/README.md#sixteen-rank-spin-criterion) | retained |

| `ArithmeticStatistics:ST.3/no-sixteen-rank-governing-field` | [§3.30 no sixteen rank governing field](../packages/ArithmeticStatistics/README.md#no-sixteen-rank-governing-field) | retained |

| `ArithmeticStatistics:ST.3/restricted-real-quadratic-family` | [§3.31 restricted real quadratic family](../packages/ArithmeticStatistics/README.md#restricted-real-quadratic-family) | retained |

| `ArithmeticStatistics:ST.3/negative-pell-historical-bounds` | [§3.31 negative pell historical bounds](../packages/ArithmeticStatistics/README.md#negative-pell-historical-bounds) | retained |

| `ArithmeticStatistics:ST.3/polynomial-order-lattice-reduction` | [§3.32 polynomial order lattice reduction](../packages/ArithmeticStatistics/README.md#polynomial-order-lattice-reduction) | retained |

| `ArithmeticStatistics:ST.3/squarefree-field-discriminant-sn` | [§3.32 squarefree field discriminant sn](../packages/ArithmeticStatistics/README.md#squarefree-field-discriminant-sn) | retained |

| `ArithmeticStatistics:ST.3/monic-polynomial-sieve-counts` | [§3.32 monic polynomial sieve counts](../packages/ArithmeticStatistics/README.md#monic-polynomial-sieve-counts) | retained |

| `ArithmeticStatistics:ST.3/monic-weak-quasi-reduction` | [§3.32 monic weak quasi reduction](../packages/ArithmeticStatistics/README.md#monic-weak-quasi-reduction) | retained |

| `ArithmeticStatistics:ST.3/strong-reduction-ring-fibres` | [§3.32 strong reduction ring fibres](../packages/ArithmeticStatistics/README.md#strong-reduction-ring-fibres) | retained |

| `ArithmeticStatistics:ST.3/trace-restricted-polynomial-sieve` | [§3.32 trace restricted polynomial sieve](../packages/ArithmeticStatistics/README.md#trace-restricted-polynomial-sieve) | retained |

| `ArithmeticStatistics:ST.3/short-generator-field-upper-bound` | [§3.32 short generator field upper bound](../packages/ArithmeticStatistics/README.md#short-generator-field-upper-bound) | retained |

| `ArithmeticStatistics:ST.3/monogenic-field-lower-bound-target` | [§3.33 monogenic field lower bound target](../packages/ArithmeticStatistics/README.md#monogenic-field-lower-bound-target) | retained |

| `ArithmeticStatistics:ST.3/monogenic-field-asymptotic-prediction` | [§3.33 monogenic field asymptotic prediction](../packages/ArithmeticStatistics/README.md#monogenic-field-asymptotic-prediction) | retained |

| `ArithmeticStatistics:ST.3/binary-discriminant-local-factors` | [§3.34 binary discriminant local factors](../packages/ArithmeticStatistics/README.md#binary-discriminant-local-factors) | retained |

| `ArithmeticStatistics:ST.3/binary-form-sieve-counts` | [§3.34 binary form sieve counts](../packages/ArithmeticStatistics/README.md#binary-form-sieve-counts) | retained |

| `ArithmeticStatistics:ST.3/binary-form-arithmetic-bertini` | [§3.34 binary form arithmetic bertini](../packages/ArithmeticStatistics/README.md#binary-form-arithmetic-bertini) | retained |

| `ArithmeticStatistics:ST.3/binary-form-field-lower-bound-target` | [§3.34 binary form field lower bound target](../packages/ArithmeticStatistics/README.md#binary-form-field-lower-bound-target) | retained |

| `ArithmeticStatistics:ST.3/unramified-alternating-extension-lower-bound-target` | [§3.34 unramified alternating extension lower bound target](../packages/ArithmeticStatistics/README.md#unramified-alternating-extension-lower-bound-target) | retained |

| `ArithmeticStatistics:ST.3/all-fields-degree-at-most-five` | [§3.35 all fields degree at most five](../packages/ArithmeticStatistics/README.md#all-fields-degree-at-most-five) | retained |

| `ArithmeticStatistics:ST.3/kluners-cyclotomic-subfamily` | [§3.36 kluners cyclotomic subfamily](../packages/ArithmeticStatistics/README.md#kluners-cyclotomic-subfamily) | retained |

| `ArithmeticStatistics:ST.3/nonabelian-tame-local-model` | [§3.37 nonabelian tame local model](../packages/ArithmeticStatistics/README.md#nonabelian-tame-local-model) | retained |

| `ArithmeticStatistics:ST.4/refinement-admissibility` | [§4.15 admissibility](../packages/ArithmeticStatistics/README.md#refinement-admissibility) | retained |

| `ArithmeticStatistics:ST.4/refinement-degree-one-arithmetic-comparison` | [§4.15 degree one arithmetic comparison](../packages/ArithmeticStatistics/README.md#refinement-degree-one-arithmetic-comparison) | retained |

| `ArithmeticStatistics:ST.4/refinement-generic-weierstrass-class` | [§4.15 generic weierstrass class](../packages/ArithmeticStatistics/README.md#refinement-generic-weierstrass-class) | retained |

| `ArithmeticStatistics:ST.4/refinement-pencil-local-global-weight` | [§4.15 pencil local global weight](../packages/ArithmeticStatistics/README.md#refinement-pencil-local-global-weight) | retained |

| `ArithmeticStatistics:ST.4/refinement-pencil-selmer-weighted-count` | [§4.15 pencil selmer weighted count](../packages/ArithmeticStatistics/README.md#refinement-pencil-selmer-weighted-count) | retained |

| `ArithmeticStatistics:ST.4/refinement-hyperelliptic-local-mass-ratio` | [§4.16 hyperelliptic local mass ratio](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-local-mass-ratio) | retained |

| `ArithmeticStatistics:ST.4/refinement-pencil-measure-comparison` | [§4.16 pencil measure comparison](../packages/ArithmeticStatistics/README.md#refinement-pencil-measure-comparison) | retained |

| `ArithmeticStatistics:ST.4/refinement-tamagawa-central-quotient` | [§4.16 tamagawa central quotient](../packages/ArithmeticStatistics/README.md#refinement-tamagawa-central-quotient) | retained |

| `ArithmeticStatistics:ST.4/refinement-hyperelliptic-weighted-upper-bound` | [§4.16 hyperelliptic weighted upper bound](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-weighted-upper-bound) | retained |

| `ArithmeticStatistics:ST.4/refinement-hyperelliptic-average-two` | [§4.19 hyperelliptic average two](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-average-two) | retained |

| `ArithmeticStatistics:ST.4/refinement-restricted-selmer-set` | [§4.17 restricted selmer set](../packages/ArithmeticStatistics/README.md#refinement-restricted-selmer-set) | retained |

| `ArithmeticStatistics:ST.4/refinement-odd-component-bound` | [§4.17 odd component bound](../packages/ArithmeticStatistics/README.md#refinement-odd-component-bound) | retained |

| `ArithmeticStatistics:ST.4/refinement-real-effective-divisor-image` | [§4.17 real effective divisor image](../packages/ArithmeticStatistics/README.md#refinement-real-effective-divisor-image) | retained |

| `ArithmeticStatistics:ST.4/refinement-order-k-strict-average` | [§4.20 order k strict average](../packages/ArithmeticStatistics/README.md#refinement-order-k-strict-average) | retained |

| `ArithmeticStatistics:ST.4/refinement-order-k-vanishing-average` | [§4.20 order k vanishing average](../packages/ArithmeticStatistics/README.md#refinement-order-k-vanishing-average) | retained |

| `ArithmeticStatistics:ST.4/refinement-small-odd-degree-points-disappear` | [§4.20 small odd degree points disappear](../packages/ArithmeticStatistics/README.md#refinement-small-odd-degree-points-disappear) | retained |

| `ArithmeticStatistics:ST.4/refinement-selmer-regulator-parity` | [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity) | retained |

| `ArithmeticStatistics:ST.4/refinement-biquadratic-parity-formula` | [§4.18 biquadratic parity formula](../packages/ArithmeticStatistics/README.md#refinement-biquadratic-parity-formula) | retained |

| `ArithmeticStatistics:ST.4/refinement-four-twist-local-parity` | [§4.18 four twist local parity](../packages/ArithmeticStatistics/README.md#refinement-four-twist-local-parity) | retained |

| `ArithmeticStatistics:ST.4/refinement-mod-eight-parity-family` | [§4.18 mod eight parity family](../packages/ArithmeticStatistics/README.md#refinement-mod-eight-parity-family) | retained |

| `ArithmeticStatistics:ST.4/refinement-odd-residue-field-models` | [§4.18 odd residue field models](../packages/ArithmeticStatistics/README.md#refinement-odd-residue-field-models) | retained |

| `ArithmeticStatistics:ST.4/refinement-full-family-corank-parities` | [§4.18 full family corank parities](../packages/ArithmeticStatistics/README.md#refinement-full-family-corank-parities) | retained |

| `ArithmeticStatistics:ST.4/refinement-admissible-family-selmer-parities` | [§4.18 admissible family selmer parities](../packages/ArithmeticStatistics/README.md#refinement-admissible-family-selmer-parities) | retained |

| `ArithmeticStatistics:ST.4/refinement-positive-empty-selmer-set` | [§4.21 positive empty selmer set](../packages/ArithmeticStatistics/README.md#refinement-positive-empty-selmer-set) | retained |

| `ArithmeticStatistics:ST.4/refinement-positive-index-two` | [§4.21 positive index two](../packages/ArithmeticStatistics/README.md#refinement-positive-index-two) | retained |

| `ArithmeticStatistics:ST.4/refinement-positive-nontrivial-sha-two` | [§4.21 positive nontrivial sha two](../packages/ArithmeticStatistics/README.md#refinement-positive-nontrivial-sha-two) | retained |

| `ArithmeticStatistics:ST.4/refinement-degree-one-points-empty-or-infinite` | [§4.21 degree one points empty or infinite](../packages/ArithmeticStatistics/README.md#refinement-degree-one-points-empty-or-infinite) | retained |

| `ArithmeticStatistics:ST.4/refinement-corrected-two-prime-criterion` | [§4.21 corrected two prime criterion](../packages/ArithmeticStatistics/README.md#refinement-corrected-two-prime-criterion) | retained |

| `ArithmeticStatistics:ST.4/refinement-rank-one-selmer-criterion` | [§4.22 rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-rank-one-selmer-criterion) | retained |

| `ArithmeticStatistics:ST.4/refinement-twisted-rank-one-selmer-criterion` | [§4.22 twisted rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-twisted-rank-one-selmer-criterion) | retained |

| `ArithmeticStatistics:ST.4/refinement-rank-one-family` | [§4.22 rank one family](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family) | retained |

| `ArithmeticStatistics:ST.4/refinement-rank-one-family-properties` | [§4.22 rank one family properties](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family-properties) | retained |

| `ArithmeticStatistics:ST.4/refinement-local-five-quotient-comparison` | [§4.22 local five quotient comparison](../packages/ArithmeticStatistics/README.md#refinement-local-five-quotient-comparison) | retained |

| `ArithmeticStatistics:ST.4/refinement-five-selmer-local-equidistribution` | [§4.22 five selmer local equidistribution](../packages/ArithmeticStatistics/README.md#refinement-five-selmer-local-equidistribution) | retained |

| `ArithmeticStatistics:ST.4/refinement-rank-one-torsion-image-bound` | [§4.23 rank one torsion image bound](../packages/ArithmeticStatistics/README.md#refinement-rank-one-torsion-image-bound) | retained |

| `ArithmeticStatistics:ST.4/refinement-rank-one-saturated-count` | [§4.23 rank one saturated count](../packages/ArithmeticStatistics/README.md#refinement-rank-one-saturated-count) | retained |

| `ArithmeticStatistics:ST.4/refinement-positive-simultaneous-rank-one` | [§4.23 positive simultaneous rank one](../packages/ArithmeticStatistics/README.md#refinement-positive-simultaneous-rank-one) | retained |

| `ArithmeticStatistics:ST.4/refinement-soluble-generic-three-selmer-elements` | [§4.24 soluble generic three selmer elements](../packages/ArithmeticStatistics/README.md#refinement-soluble-generic-three-selmer-elements) | retained |

| `ArithmeticStatistics:ST.4/refinement-plane-cubic-height-and-orbit-transfer` | [§4.24 plane cubic height and orbit transfer](../packages/ArithmeticStatistics/README.md#refinement-plane-cubic-height-and-orbit-transfer) | retained |

| `ArithmeticStatistics:ST.4/refinement-soluble-ternary-fundamental-count` | [§4.24 soluble ternary fundamental count](../packages/ArithmeticStatistics/README.md#refinement-soluble-ternary-fundamental-count) | retained |

| `ArithmeticStatistics:ST.4/refinement-positive-plane-cubic-solubility` | [§4.24 positive plane cubic solubility](../packages/ArithmeticStatistics/README.md#refinement-positive-plane-cubic-solubility) | retained |

| `ArithmeticStatistics:ST.5/refinement-lc-quadratic` | [§5.23 lc quadratic](../packages/ArithmeticStatistics/README.md#refinement-lc-quadratic) | retained |

| `ArithmeticStatistics:ST.5/refinement-weak-metabolic` | [§5.23 weak metabolic](../packages/ArithmeticStatistics/README.md#refinement-weak-metabolic) | retained |

| `ArithmeticStatistics:ST.5/refinement-maximal-isotropics` | [§5.24 maximal isotropics](../packages/ArithmeticStatistics/README.md#refinement-maximal-isotropics) | retained |

| `ArithmeticStatistics:ST.5/refinement-joint-parity-weight` | [§5.25 joint parity weight](../packages/ArithmeticStatistics/README.md#refinement-joint-parity-weight) | retained |

| `ArithmeticStatistics:ST.5/refinement-wood-grid-separator` | [§3.38 wood grid separator](../packages/ArithmeticStatistics/README.md#refinement-wood-grid-separator) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/refinement-lc-finite-reductions` | [§5.26 lc finite reductions](../packages/ArithmeticStatistics/README.md#refinement-lc-finite-reductions) | retained |

| `ArithmeticStatistics:ST.5/refinement-lc-canonical-measure` | [§5.26 lc canonical measure](../packages/ArithmeticStatistics/README.md#refinement-lc-canonical-measure) | retained |

| `ArithmeticStatistics:ST.5/refinement-lc-random-intersection` | [§5.26 lc random intersection](../packages/ArithmeticStatistics/README.md#refinement-lc-random-intersection) | retained |

| `ArithmeticStatistics:ST.5/refinement-lc-restricted-product` | [§5.26 lc restricted product](../packages/ArithmeticStatistics/README.md#refinement-lc-restricted-product) | retained |

| `ArithmeticStatistics:ST.5/refinement-sha-one-vanishing` | [§5.27 sha one vanishing](../packages/ArithmeticStatistics/README.md#refinement-sha-one-vanishing) | retained |

| `ArithmeticStatistics:ST.5/refinement-selmer-quadratic-intersection` | [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection) | retained |

| `ArithmeticStatistics:ST.5/refinement-joint-parity-moments` | [§5.28 joint parity moments](../packages/ArithmeticStatistics/README.md#refinement-joint-parity-moments) | retained |

| `ArithmeticStatistics:ST.5/refinement-squarefree-selmer-conjecture` | [§5.28 squarefree selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-squarefree-selmer-conjecture) | retained |

| `ArithmeticStatistics:ST.5/refinement-odd-degree-jacobian-conjecture` | [§5.28 odd degree jacobian conjecture](../packages/ArithmeticStatistics/README.md#refinement-odd-degree-jacobian-conjecture) | retained |

| `ArithmeticStatistics:ST.5/refinement-even-genus-two-selmer-conjecture` | [§5.28 even genus two selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-even-genus-two-selmer-conjecture) | retained |

| `ArithmeticStatistics:ST.5/refinement-smooth-cylinder-measure` | [§5.29 smooth cylinder measure](../packages/ArithmeticStatistics/README.md#refinement-smooth-cylinder-measure) | retained |

| `ArithmeticStatistics:ST.5/refinement-ogr-smooth-projective` | [§5.29 ogr smooth projective](../packages/ArithmeticStatistics/README.md#refinement-ogr-smooth-projective) | retained |

| `ArithmeticStatistics:ST.5/refinement-ogr-components` | [§5.29 ogr components](../packages/ArithmeticStatistics/README.md#refinement-ogr-components) | retained |

| `ArithmeticStatistics:ST.5/refinement-ogr-prime-power-count` | [§5.29 ogr prime power count](../packages/ArithmeticStatistics/README.md#refinement-ogr-prime-power-count) | retained |

| `ArithmeticStatistics:ST.5/refinement-ogr-schubert-dimension` | [§5.29 ogr schubert dimension](../packages/ArithmeticStatistics/README.md#refinement-ogr-schubert-dimension) | retained |

| `ArithmeticStatistics:ST.5/refinement-all-rank-delaunay` | [§5.30 all rank delaunay](../packages/ArithmeticStatistics/README.md#refinement-all-rank-delaunay) | retained |

| `ArithmeticStatistics:ST.5/refinement-positive-rank-all-primes` | [§5.30 positive rank all primes](../packages/ArithmeticStatistics/README.md#refinement-positive-rank-all-primes) | retained |

| `ArithmeticStatistics:ST.5/refinement-rank-zero-all-primes-infinite` | [§5.30 rank zero all primes infinite](../packages/ArithmeticStatistics/README.md#refinement-rank-zero-all-primes-infinite) | retained |

| `ArithmeticStatistics:ST.5/refinement-symplectic-harmonic-weights` | [§5.30 symplectic harmonic weights](../packages/ArithmeticStatistics/README.md#refinement-symplectic-harmonic-weights) | retained |

| `ArithmeticStatistics:ST.5/refinement-sparse-prime-weighted-limit` | [§5.30 sparse prime weighted limit](../packages/ArithmeticStatistics/README.md#refinement-sparse-prime-weighted-limit) | retained |

| `ArithmeticStatistics:ST.5/refinement-injection-moment-conjecture` | [§5.31 injection moment conjecture](../packages/ArithmeticStatistics/README.md#refinement-injection-moment-conjecture) | retained |

| `ArithmeticStatistics:ST.5/refinement-kummer-direct-summand` | [§5.31 kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-kummer-direct-summand) | retained |

| `ArithmeticStatistics:ST.5/refinement-adelic-kummer-direct-summand` | [§5.31 adelic kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-adelic-kummer-direct-summand) | retained |

| `ArithmeticStatistics:ST.5/refinement-global-image-splitting-conjecture` | [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture) | retained |

| `ArithmeticStatistics:ST.5/refinement-trivial-action-global-splitting` | [§5.31 trivial action global splitting](../packages/ArithmeticStatistics/README.md#refinement-trivial-action-global-splitting) | retained |

| `ArithmeticStatistics:ST.5/refinement-wood-coefficient-bound` | [§3.38 wood coefficient bound](../packages/ArithmeticStatistics/README.md#refinement-wood-coefficient-bound) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/refinement-wood-subgroup-bound` | [§3.38 wood subgroup bound](../packages/ArithmeticStatistics/README.md#refinement-wood-subgroup-bound) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/refinement-wood-grid-uniqueness` | [§3.38 wood grid uniqueness](../packages/ArithmeticStatistics/README.md#refinement-wood-grid-uniqueness) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/refinement-wood-bounded-moment-limit` | [§3.38 wood bounded moment limit](../packages/ArithmeticStatistics/README.md#refinement-wood-bounded-moment-limit) | retained; layer 5→3 |

| `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-zero` | [§4.25 balanced three rank zero](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-zero) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-balanced-three-rank-one` | [§4.25 balanced three rank one](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-one) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-positive-three-ranks` | [§4.25 positive three ranks](../packages/ArithmeticStatistics/README.md#refinement-positive-three-ranks) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-analytic-rank-zero-criterion` | [§4.25 analytic rank zero criterion](../packages/ArithmeticStatistics/README.md#refinement-analytic-rank-zero-criterion) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-positive-analytic-rank-zero` | [§4.25 positive analytic rank zero](../packages/ArithmeticStatistics/README.md#refinement-positive-analytic-rank-zero) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-positive-weak-bsd` | [§4.25 positive weak bsd](../packages/ArithmeticStatistics/README.md#refinement-positive-weak-bsd) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-two-selmer-nonlift` | [§4.26 two selmer nonlift](../packages/ArithmeticStatistics/README.md#refinement-two-selmer-nonlift) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-basic-bounds` | [§4.27 five basic bounds](../packages/ArithmeticStatistics/README.md#refinement-five-basic-bounds) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-balanced-bounds` | [§4.27 five balanced bounds](../packages/ArithmeticStatistics/README.md#refinement-five-balanced-bounds) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-root-balanced-family` | [§4.27 five root balanced family](../packages/ArithmeticStatistics/README.md#refinement-five-root-balanced-family) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-full-average-rank` | [§4.27 five full average rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-average-rank) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-full-low-rank` | [§4.27 five full low rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-low-rank) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-five-full-rank-zero` | [§4.27 five full rank zero](../packages/ArithmeticStatistics/README.md#refinement-five-full-rank-zero) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-jacobian-marked-average` | [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average) | retained; layer 5→4 |

| `ArithmeticStatistics:ST.5/refinement-abelian-three-isogeny-average` | [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average) | retained |

| `ArithmeticStatistics:ST.5/refinement-endomorphism-rank-bound` | [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound) | retained |

| `ArithmeticStatistics:ST.5/refinement-multiplication-three-rank-bound` | [§5.32 multiplication three rank bound](../packages/ArithmeticStatistics/README.md#refinement-multiplication-three-rank-bound) | retained |

| `ArithmeticStatistics:ST.5/refinement-finite-extension-rank-bound` | [§5.32 finite extension rank bound](../packages/ArithmeticStatistics/README.md#refinement-finite-extension-rank-bound) | retained |

| `ArithmeticStatistics:ST.5/refinement-elliptic-explicit-twist-rank` | [§5.32 elliptic explicit twist rank](../packages/ArithmeticStatistics/README.md#refinement-elliptic-explicit-twist-rank) | retained |

| `ArithmeticStatistics:ST.5/refinement-signature-positive-twists` | [§5.32 signature positive twists](../packages/ArithmeticStatistics/README.md#refinement-signature-positive-twists) | retained |

| `ArithmeticStatistics:ST.5/refinement-complex-place-obstruction` | [§5.32 complex place obstruction](../packages/ArithmeticStatistics/README.md#refinement-complex-place-obstruction) | retained |

## Ownership, existing libraries and moves

Checked the read-only current TauCetiRoadmap tree at `0d144d044dacebca17b654695b6f1ad58f159b27` and current TauCeti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current tree, including Completed, rather than the older atlas snapshot controls deferrals. Read two current upstream models and the package/expansion guides before writing. Searched by mathematical objects, fields and operations, including the nine newer directions and completed RestrictedProducts/EffectiveBounds, then read the relevant interfaces. No Lake command ran in either current checkout.

The sole whole-target removal is `field-permutation-type`: PolynomialGaloisGroups Layers 0,2,6 already own the permutation-action predicate. The field-family adapter only specializes it. The second acceptable-weight definition is merged rather than independently reconstructed. Additional internal overlap is represented as a named adapter to the same owner, for example the Layer 1 fixed-degree binary-discriminant evaluation interface reuses Layer 0's universal polynomial.

Existing finite quadratic modules are reused: `TauCeti.FiniteQuadraticModule.IsIsotropic`, `IsLagrangian`, `orthogonalQuotient`, `orthogonalQuotientMk`, quadratic/pairing compatibility, surjectivity, equality and nondegeneracy. New targets are varying maximal-isotropic parameter sets, their reduction maps, fibres and probability. The scalar finite-measure determinacy theorem `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` and `ext_of_mgf` are imported; they do not replace discrete group/rank moment uniqueness. `MeasureTheory.Measure.infinitePi` and projective measures are imported. IntegralLattices' symmetric forms do not supply the alternating-lattice monodromy targets. Generic orders, Picard groups, norm maps, discriminants, Abel maps, elliptic Selmer groups and minimal models stay with their existing owners.

Native declarations read at the compile pins include Mathlib `Northcott`, `Northcott.comp_of_finite_fibers`, `Polynomial.discr` (including its actual-degree convention), `Algebra.discr`, `NumberField.discr`, `NumberField.dedekindZeta_residue`, `Chebyshev.eventually_primeCounting_le`, the product-measure interfaces, and TauCeti `normLE`, `coe_normLE`, `Nat.card_coe_normLE`, `summatory`. The quartic invariant, polynomial/ring discriminant and field discriminant are not conflated.

Build order: ArithmeticStatistics and AnalyticNumberTheory are the tier-14 companion bundle. Every named prospective prerequisite in the final roadmap is lower tier or a bundle partner. The off-tier requests below become local support targets or exact lower-owner specializations; the original higher roadmap must import the resulting interface in a later planning pass.

| Original direction | Package ownership |
|---|---|
| SieveMethodsAndPrimePatterns SV.1/SV.2/SV.5 | Layer 0 squareclass denominators; Layer 2 geometric/coefficient sieves; Layer 3 quadratic Jacobi, spin and short-character estimates |
| ProbabilisticAndMetricNumberTheory PM.1 | Layer 4 fixed-real-root estimate, with iid moments, simple roots and compatible parity |
| FunctionFieldArithmetic | Layer 0 exact quadratic slices, class-field and Picard comparison |
| InductionRestrictionPartII reduced multipliers/covers | IG.3 exact marked reduced-cover contract |
| InductionRestrictionPartII signatures/type computations | Layer 0/3 embedded types and finite certificates |
| RepresentationTheory extra regulator constants | Existing induction/restriction plus Layer 4 Brauer relation/regulator specialization, self-duality retained |
| JacobianChallengePartII | SF.3 unpointed degree torsors, section-free Abel maps and Brauer obstruction; statistical adapters here |
| AbelianSchemesAndArithmeticModuliPartII/PELModuli | Existing A6 Rosati geometry plus Layer 0 finite-field counting and Layer 5 explicit H1/H2 assumptions |
| FiniteFieldsAndCharacterSums/ExponentialSumsAndCircleMethod | IG.2 geometric estimates, Layer 3 character sums and Layer 5 uniform cohomological trace targets |
| WeilConjectures | DeligneWeightsAndPurity curve bounds with exact genus/cardinality hypotheses |
| ComplexMultiplicationAndExplicitReciprocity | Layer 5 arithmetic CM action, good-reduction twist and local ratios, including exceptional automorphisms |
| RankZeroOneBSD | Layer 4 modularity plus two distinct specialized rank-zero/rank-one converse inputs |
| FoundationsAndLibraryIntegration / UPSTREAM bookkeeping | Replaced by explicit native declarations and current Tau Ceti roadmap layers |

Within this package, the Gaussian/group-moment/matrix and separator tools move from Layer 5 to Layer 3; higher Selmer means, rank consequences and height moments move to Layer 4; coefficient vectors and exact function-field slices move to Layer 0; Stickelberger and the binary weak/strong comparison follow the general binary-order construction in Layer 1. The exhaustive table above records propagated prerequisite moves as well.

## Mathematical audit and corrections

This was a direct author pass through all target statements, hypotheses, conventions, divisions and tests, followed by the finite computations below and a signature comparison of all kept Lean declarations. Successful elaboration alone was not used as truth evidence. The finite checks are witnesses and negative controls, not proofs of asymptotics.

| Statements/interfaces | Instances and outcome | Resulting treatment |
|---|---|---|
| Heights/densities | Empty sets, finite/empty denominator, natural height at cutoff 3 gives 4; rational absolute value is not Northcott | Explicit reference family, finite sublevels, positivity before division, inclusive/strict comparisons and positive rescaling |
| Quartic invariants/discriminants | 3,125 vectors in {-2,-1,0,1,2}^5 checked; x⁴−y⁴ gives I=-12,J=0,Δ=-256; x³y−xy³ gives Δ=4 | Integral 27Δ=4I³−J²; fixed-degree leading-zero convention; distinct curve height normalization |
| Cubic Haar normalization | 625 small signed cubic vectors: absolute Lie-direction determinant=2|Δ|; dk=dθ/(2π) | Probability-Haar coefficient 4π; f=x³−xy² has Δ=4 and tangent determinant 8 |
| Pencil/minor conventions | n=0,1,3, zero pencil, congruence determinant square, row swap | Signed fixed-size determinant; vector versus projective dimensions; no quadratic-isotropy assertion from the dyadic polar form |
| Sieve multiplicities | Δ=0 excluded; Δ=36,M=5 has the sole squarefree contributor 6; coupled CRT two out of 15 | Singular locus separate; all-orbit quartic transport, not only S4 orbits |
| Stabilizer error | Two ε/2 losses add | O(X^(3/4+ε)), rather than dropping or doubling the stated loss |
| Even binary tails | θ4=1/21, θn=1/(4n) for even n≥6; n=2 separate | Paired-row and restricted-Gram assumptions retained; δ,η,ξ,τ inequalities explicit; numerical endpoint conditional |
| Four-rank phase/planes | k=0,1,2 good planes count 1,2,5; directed phase on ((1,0),0) is 1, reverse 0 | Directed and symmetrized phases distinguished; elementary-test rank uniqueness is its own target |
| Matrix/quadratic laws | Symmetric 2×2 rank counts at p=2,3,5,7 are (1,p²−1,p³−p²); hyperbolic plane has two quadratic-isotropic lines, including p=2 | Characteristic-two quadratic vanishing retained; zero-dimensional case not forced to half parity |
| Odd finite-field quartics | Exhausted 243 small-coefficient quartics at each p=3,5,7 with Δ≠0; all soluble | Odd-prime finite-field statement checked, invariant mass separately p≥5 |
| Regulator constant | Trivial C2² character gives 1/2; other characters give 2, all square class 2 | Zero relation one; self-dual representation hypothesis retained; non-self-dual dual pair square |
| Real component estimates | (m,k)=(3,1),(5,3),(3,9) give 3,15,4 | Fixed-k polynomial numerator over 2^(m−1); random-root theorem only fixed counts, normalized uniform coefficients |
| Selmer/rank consequences | Nonlift bound is on elements, not curves; exact five-Selmer mixtures give 16503/80000 and 100501/120000 | Finite-height subtraction retained; no addition of unrelated limsups; Sha conditions preserved |
| Probability/parity | k=0,1,2,3,4 coupling totals all one; k=0 carrier singleton | Factor 2^(k−1) only for k≥1; independent prime laws have wrong support |
| Discrete moments | Vanishing escaping mass p^-n at rank n changes surjection mean by ~1 | Tightness/uniform integrability, bounded-exponent versus full-group tails retained |
| Wood arithmetic profiles | Stable stars-and-bars lower bound alone cannot fix boundary oscillation | Ordinary limit is conjectural unless the whole rational component profile is eventually constant |
| CM/rank-index | General Z[ψ]-module need not have the asserted positive rank-index ratio | General endomorphism bound assumes c>0; [3] specialization retains c=1 |
| ppav/spacings | Repeated-root multiplicities give an atom; real-Weil surface factor retained | H1/H2 are explicit; general non-atomic comparison law suffices, no unprovided GUE theorem |
| de Jong exact-height mean | Weighted denominator tends to positive L(q); nonidentity bound C(q); constant-j count times Selmer bound negligible for sufficiently large q | Read original author DVI; automorphism weighting, exact height and unweighted comparison explicit; no secondary-height guess |

The monogenic field asymptotic remains a conjectural proposition requiring cusp control and uniqueness; the number-field three-isogeny coregular interface explicitly names all six inputs; Smith-type corank distribution is an assumed law in its deduction, with no upward dependency. The target statement may be conditional while proving its precise missing estimate is itself a support target here.

## Direct source checks

No source passage or source file is included in the repository. The cleared-library index was read; this package used public articles and author copies, not an uncleared book. The checks below are author checks of selected passages, not a claim to have reread all 130 source editions in full. The accepted source locators are otherwise retained for independent review.

A deterministic sample of 15 accepted targets (seed 10115) was checked against the public full texts. This list records the source actually checked, including author-versus-journal pagination.

| Target | Directly read locator and outcome |
|---|---|

| `squarefree-field-discriminant-sn` | BSW I §1 p.2 and §5 p.26: maximal-order/S_n implication, degree fixed |

| `invariant-measure-on-binary-cubic-forms` | BST Proposition 23, §5.3 p.12; retained probability-SO2 normalization checked by the tangent determinant above |

| `nonsingular-binary-quartic-forms-over-finite-fields-are-soluble` | BS2 Lemma 3.15 p.30 and Proposition 3.18 proof p.33: odd prime solubility, p≥5 invariant mass |

| `cubic-secondary-local-factor-evaluation` | BST Table 1, Lemma 28, (56), pp.21–22; (57) is p.25, not p.22; locator corrected |

| `sieve-to-acceptable-functions-for-binary-cubic-forms` | BST §8.3 p.24 and §8.4 p.25: actual weighted local sieve and maximal mass |

| `constant-rescaling-of-a-height` | BS2 §3 opening p.22: invariant/curve height factor and average family |

| `local-mass-formula-for-locally-soluble-forms` | BS2 Proposition 3.9 p.26: quotient/kernel mass and differential normalization |

| `stable-parity-multidegree-count` | Wood arXiv:1702.04644v2 proof of Theorem 4.8 p.24: stable orthant and parity count |

| `nonabelian-admissibility-and-abelianization` | Wood arXiv version Proposition 2.2 p.8 and Lemma 6.2 pp.28–29; explicit author-version citation added. The NSF published copy timed out, so journal pages were not claimed as directly checked |

| `coefficient-box` | BSW II §1 p.2: unweighted maximum coefficient height; p.1 locator corrected |

| `secondary-cubic-lattice-coefficient` | BST Theorem 27 and Remark 3 pp.19–20: lattice indices and translate caveat |

| `odd-root-criterion` | BSW I §1.1 p.4: strong/weak root description. Removed an unnecessary inaccurate Proposition 2.2 locator |

| `refinement-soluble-ternary-fundamental-count` | Plane-cubic paper Theorem 16 p.10 and Theorem 2 proof pp.11–13: fundamental region to rational-soluble coefficients |

| `reducible-monic-binary-cubic-forms-of-bounded-invariants` | BS2 Lemma 2.22 p.21: reducible resolvent estimate and eligibility; the accepted target name is listed in the conservation inventory |

| `refinement-admissible-family-selmer-parities` | BGW Theorem A.2 p.35 and proof p.37, with Theorem A.1 and the exact cube/number-field height convention |

Additional direct checks: BS2 Theorems 1.1/1.3 and quartic stabilizer/counting passages; BS3 introduction and average-four/rank statements; BS4 Theorems 1–3; BS5 introduction and rank constants; BSS Theorems 1.1/1.2 and Jacobian-height normalization; HCL III Theorem 1 and HCL IV Theorems 1/2, Corollary 3; BKLPR Proposition 2.1/Corollary 2.2, liftable reduction-image measure; BKLOS Theorems 2.1–2.3 and the rank-index condition; Andrade–Jung Theorem 1.2, journal pp.578–579 (primitive order classes and positive norm-one regulator); Delaunay–Jouhet Theorem 5 and proof pp.6–8; Dembo–Poonen–Shao–Zeitouni Theorems 1.1/1.2 author pp.2–3; Dokchitser–Dokchitser §§2.i–2.ii pp.11–16 and semistable pp.39–40.

For de Jong the public primary is the 30-page author DVI `surfaces2.dvi`, not a guessed PDF. Read author pp.1–2,8–11,20,24–25,29: Theorem 1.2, Propositions 4.12/4.14/5.14/7.5/7.9 and Lemma 10.2. The exact denominator is `q^(−10d−1)I_d→(1−q^-9)(1−q^-10)/(1−q^-1)`. The nonidentity limsup is bounded by `3/((1−q^-3)(1−q^-2)^2(1−q^-1)^2)`. Nonconstant-j automorphism order two and constant-j/Selmer-dimension bounds supply the unweighted comparison for sufficiently large fixed q. This resolves the inherited primary-source/height question.

Reacquisition receipts for the public full texts used in this run follow. Hashes identify the copies; they do not assert that every page of every downloaded paper was read.

| Public copy | SHA-256 |
|---|---|

| [bhargava-shankar-2013](https://arxiv.org/pdf/1006.1002v3) | `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf` |

| [bst](https://arxiv.org/pdf/1005.0672v3) | `d45b16cdb6b34655634f4305416ad68083d6e6e5674907aefc85a30ac8937f74` |

| [hcl3](https://annals.math.princeton.edu/wp-content/uploads/annals-v159-n3-p08.pdf) | `70c2d5bbedbd7e5e9e5d7d57001b93779d760cd6f2c0798c831e5f1f31d90f4b` |

| [hcl4](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n1-p02.pdf) | `9673d33b4e76d305fed02219962ee962ed9481ce134c649c3168f75bade46a26` |

| [pr](https://arxiv.org/pdf/1009.0287v2) | `b2a91d0b2b01863c659500d224e922d0e40004c45e917fca23b59a59e5307c6e` |

| [bklpr](https://arxiv.org/pdf/1304.3971v2) | `370b9b8d853103b1388bdb52e1839e8c8e60c754f81b64c100a1ec89bb515c21` |

| [bgw](https://arxiv.org/pdf/1310.7692v2) | `8833a226eea99eab7e48b90de7d747fa535eafe032d5c62fd50812d38ad4c4f2` |

| [bs3](https://arxiv.org/pdf/1007.0052v2) | `317479d621b376ef3ca769a8cf1e7bb3d1b8babefcc726f7e2a9e761b8617108` |

| [bs4](https://arxiv.org/pdf/1312.7333v1) | `1fe01e72dc60658ed51ffecef6ffb6a83818449a0d813fb24c480de678562c35` |

| [bs5](https://arxiv.org/pdf/1312.7859v1) | `0fad7f4eab6ade59ca50ddc1f12fb6f50126b5eca204a9fef650649b3203fd6d` |

| [bss](https://arxiv.org/pdf/2110.09063v1) | `8f568036291bd251d8598770fa956ec7893675b348259eca1bc5326618ff6be0` |

| [bklospublished](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf) | `af4e5ab9b250700c95c09946509e88b8a3f4a4f7efedf6ddc882a5f742478880` |

| [wood](https://arxiv.org/pdf/1402.5149v2) | `0e12d2fc84bf836603d719e8a7d5146b911ede1f582592325b98422d362cc90c` |

| [bsw1](https://arxiv.org/pdf/1611.09806v3) | `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83` |

| [bsw2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/FD680BEF350C0140B682AB604D45F415/S2050508625000095a.pdf/squarefree-values-of-polynomial-discriminants-ii.pdf) | `b6e5d1701f487b813e9d6a0b26f9b8671c02c414996298cbba71fe5060e90740` |

| [geometric](https://arxiv.org/pdf/1402.0031) | `f7bbd98a2382e170df8f0d4279332a25541f47ba56df1b59879a36c004078c66` |

| [bsw-global](https://arxiv.org/pdf/1512.03035v2) | `f913019717d4605d7b8550e484e5edb0e9dafcbe79c083e0b941fb7cb54591ac` |

| [fk-ranks](https://math.uni-paderborn.de/fileadmin/mathematik/AG-Computeralgebra/Publications-klueners/ranks.pdf) | `73ca99eba727ed110f68d9c6d4a9313a05923faf9449979270b97a3743bf791f` |

| [evw16](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf) | `6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6` |

| [loww-published](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6AABE169B5BA8192FE036455DE4F806F/S2050508625000009a.pdf/the-average-size-of-3-torsion-in-class-groups-of-2-extensions.pdf) | `d5051ab0d37f9985f1adea5cbfee2263812ce96de2b354598448765411344ce5` |

| [ps](https://math.mit.edu/~poonen/papers/sha.pdf) | `3b9a619423358bc877fd2123b73a759157a728ec11e0f7b0aa48bd0333d7149a` |

| [bs-rank](https://arxiv.org/pdf/1401.0233) | `205e4a73ae9f3deb9afc541a5bb33ebb6c82708b54eec264d4bc22d18759c087` |

| [plane](https://arxiv.org/pdf/1402.1131) | `cc7e4d90291c7859c1fb48defd315e8efdf90b39a09677ec1bc76a9ca0bdfd78` |

| [lt18](https://arxiv.org/pdf/1511.02212v1) | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |

| [km-governing](https://arxiv.org/pdf/1809.09597v1) | `d56a738ae1b1487dd01b92b7084dd6bd4b9a041a85efdd2fac66b86afd8af433` |

| [delaunay-moments](https://arxiv.org/pdf/1303.7337) | `6864a1f897b121c79ec73ee0c35b43577bf3188b0682ca5c9f3aac0df33fed88` |

| [wood19arxiv](https://arxiv.org/pdf/1702.04644v2) | `2eacf07f9c79a08a65bbfa332b964f0f9bd4ab5abb93e5db8be72e43669be1bd` |

| [andrade-jung](https://link.springer.com/content/pdf/10.1007/s00605-018-1162-2.pdf) | `dc4a2cfb44c2daadcb2a2210f8cca9e02c51f7c0ce1dcc2fb44c06517de49651` |

| [few-roots](https://math.mit.edu/~poonen/papers/fewzeros.pdf) | `864450d4469e069d582d4eb61db9f99c57ae24c9dc5b767d4642277e2b4dd4a8` |

| [dd-reg](https://arxiv.org/pdf/0709.2852) | `b0d15a38e574c9e8aad8af9c13666da7950aba1d43d380cae86f7169b1684ee1` |

| [dejong](https://www.math.columbia.edu/~dejong/papers/surfaces2.dvi) | `0868c4616912516fa7ab3c450f972d970645e47cc65985508830ffba649ffae9` |

## Gap-record routing

Each row names an input gap record and its retained consumer target(s). Full mathematical support is in the linked target and the corresponding layer's supporting paragraphs. “Unbound cross-part refinements” records are discharged by the exhaustive target inventory and acyclic links; native-signature records are handled by retaining heavy carriers in README rather than sorry-defining them. Original-proof requests remain proof targets; statistical/model conjectures and explicit restricted estimates retain their stated hypotheses.

| Packet / gap index | Input concern | Package consumer locations |
|---|---|---|

| core / 0 | Bhargava's uniformity estimate for weakly divisible discriminants of pairs of ternary quadratic forms (Theorem 2.19 = [4, Proposition 23]) | [§2.5 weakly divisible quartic discriminants via ternary pairs](../packages/ArithmeticStatistics/README.md#weakly-divisible-quartic-discriminants-via-ternary-pairs); [§2.5 uniformity for weakly divisible quartic discriminants](../packages/ArithmeticStatistics/README.md#uniformity-for-weakly-divisible-quartic-discriminants); [§2.5 uniformity estimate for infinitely many congruence conditions](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-infinitely-many-congruence-conditions); [§2.5 squarefree sieve for binary quartic forms](../packages/ArithmeticStatistics/README.md#squarefree-sieve-for-binary-quartic-forms) |

| core / 1 | The bound O(X^{1/4}) for pairs of ternary quadratic forms with a fixed reducible cubic resolvent ([4, proof of Lemma 12]) | [§2.3 orbits with large stabilizer are negligible](../packages/ArithmeticStatistics/README.md#orbits-with-large-stabilizer-are-negligible) |

| core / 2 | Class-group statistics: sources now read, but the proofs of the quoted moment theorems are not decomposed | [§3.8 fouvry kluners moments of four ranks](../packages/ArithmeticStatistics/README.md#fouvry-kluners-moments-of-four-ranks); [§3.7 bhargava mean of two torsion in cubic class groups](../packages/ArithmeticStatistics/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups) |

| core / 3 | Proofs of Bhargava's quartic and quintic field counts are not decomposed | [§3.7 bhargava count of quartic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quartic-fields); [§3.7 bhargava count of quintic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quintic-fields); [§3.7 bhargava shankar wang counts over number fields](../packages/ArithmeticStatistics/README.md#bhargava-shankar-wang-counts-over-number-fields); [§3.7 bhargava mean of two torsion in cubic class groups](../packages/ArithmeticStatistics/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups) |

| core / 4 | Second-order terms (BST Sections 6, 7 and 9) are not decomposed | [§3.5 roberts second order term for cubic fields](../packages/ArithmeticStatistics/README.md#roberts-second-order-term-for-cubic-fields); [§3.5 second order term for the mean of three torsion](../packages/ArithmeticStatistics/README.md#second-order-term-for-the-mean-of-three-torsion); [§3.5 second order term for cubic orders with local specifications](../packages/ArithmeticStatistics/README.md#second-order-term-for-cubic-orders-with-local-specifications) |

| core / 5 | Siegel's indefinite count has no public proof in the sources read | [§3.6 siegel count of indefinite binary quadratic forms](../packages/ArithmeticStatistics/README.md#siegel-count-of-indefinite-binary-quadratic-forms); [§3.6 quoted classical counts for binary quadratic and cubic forms](../packages/ArithmeticStatistics/README.md#quoted-classical-counts-for-binary-quadratic-and-cubic-forms) |

| core / 6 | The uniformity for totally ramified primes rests on a class-field-theory argument that no source read proves | [§3.3 cubic fields totally ramified at large primes are sparse](../packages/ArithmeticStatistics/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse); [§3.3 davenport heilbronn mean of three torsion](../packages/ArithmeticStatistics/README.md#davenport-heilbronn-mean-of-three-torsion); [§3.4 density of cubic orders with local specifications](../packages/ArithmeticStatistics/README.md#density-of-cubic-orders-with-local-specifications) |

| core / 7 | Wright's theorem (Malle's conjecture for abelian groups) is quoted | [§3.9 kluners counterexample to malle conjecture](../packages/ArithmeticStatistics/README.md#kluners-counterexample-to-malle-conjecture) |

| core / 8 | The p-adic change-of-variables formula for polynomial maps has no owner in the atlas | [§4.5 p adic change of measure for binary quartic forms](../packages/ArithmeticStatistics/README.md#p-adic-change-of-measure-for-binary-quartic-forms); [§4.5 volume of pgl2 zp](../packages/ArithmeticStatistics/README.md#volume-of-pgl2-zp) |

| core / 9 | The uniformity O(X/p²) for all integral binary cubic forms with p² ∣ disc is only partly planned | [§4.8 uniformity estimate for elliptic curves](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-elliptic-curves) |

| core / 10 | The Delone–Evertse uniform bound for cubic Thue equations has no owner | [§4.8 uniformity estimate for elliptic curves](../packages/ArithmeticStatistics/README.md#uniformity-estimate-for-elliptic-curves) |

| core / 11 | Smith's 2^∞-Selmer distribution theorem (owned by ArithmeticStatisticsPartIISmithMethod) | [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law) |

| core / 12 | Orbit parametrisations and counts for 3-, 4- and 5-Selmer elements | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) |

| core / 13 | Second-moment proof of Bhargava–Shankar–Swaminathan | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group) |

| core / 14 | Kane's character-sum estimates and Swinnerton-Dyer's combinatorial theorem | [§5.9 two selmer distribution in full two torsion twist families](../packages/ArithmeticStatistics/README.md#two-selmer-distribution-in-full-two-torsion-twist-families) |

| core / 15 | BKLOS binary-cubic parametrisation and counting over number fields | [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups) |

| core / 16 | Cassels–Tate pairing and its isogeny adjointness | [§5.10 three isogeny selmer parity](../packages/ArithmeticStatistics/README.md#three-isogeny-selmer-parity) |

| core / 17 | Local invariants of isogenous elliptic curves at 2 and 3 | [§5.10 tamagawa ratio under potentially good reduction](../packages/ArithmeticStatistics/README.md#tamagawa-ratio-under-potentially-good-reduction) |

| core / 18 | Rubin's CM lemmas | [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction); [§5.11 cm three isogeny has selmer ratio one](../packages/ArithmeticStatistics/README.md#cm-three-isogeny-has-selmer-ratio-one) |

| core / 19 | Canonical measure on ℤ_p-points (Oesterlé–Serre) and the orthogonal Grassmannian | [§5.7 bklpr random isotropic intersection law](../packages/ArithmeticStatistics/README.md#bklpr-random-isotropic-intersection-law); [§5.6 bklpr alternating cokernel limit](../packages/ArithmeticStatistics/README.md#bklpr-alternating-cokernel-limit) |

| core / 20 | p-rank marginal of A_1 | [§5.8 bklpr conjecture implies rank and selmer laws](../packages/ArithmeticStatistics/README.md#bklpr-conjecture-implies-rank-and-selmer-laws) |

| core / 21 | Generic mod-p image of E_{A,B} | [§4.13 rational p torsion has density zero](../packages/ArithmeticStatistics/README.md#rational-p-torsion-has-density-zero) |

| core / 22 | de Jong's function-field 3-Selmer bound | [§5.9 function field 3 selmer average bound](../packages/ArithmeticStatistics/README.md#function-field-3-selmer-average-bound) |

| core / 23 | Wood's moment-determination theorem (proof not decomposed) | [§3.13 moments determine cohen lenstra limits for all p and u](../packages/ArithmeticStatistics/README.md#moments-determine-cohen-lenstra-limits-for-all-p-and-u) |

| core / 24 | Certified D_4 comparison | [§5.2 dihedral quartic proven average versus prediction](../packages/ArithmeticStatistics/README.md#dihedral-quartic-proven-average-versus-prediction) |

| core / 25 | Existence of the enhanced Cohen–Lenstra limits (Lipnowski–Tsimerman Definition 5.16) | [§5.3 enhanced cohen lenstra finite level law](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-finite-level-law); [§5.3 enhanced cohen lenstra conjecture](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-conjecture) |

| core / 26 | Finite-field abelian-variety inputs now planned in AbelianSchemesAndArithmeticModuliPartII | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 27 | The GUE spacing law is not planned anywhere | [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs) |

| core / 28 | EVW homological stability and uniform Betti bound (stated input) | [§5.19 uniform function field surjection moment estimate](../packages/ArithmeticStatistics/README.md#uniform-function-field-surjection-moment-estimate) |

| core / 29 | Reduced Schur multiplier inputs for Wood's component counts | [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment); [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 complete stable range component sum](../packages/ArithmeticStatistics/README.md#complete-stable-range-component-sum) |

| core / 30 | Full mod-ℓ monodromy of M_1 and M_2 (Achter–Pries base cases) | [§5.17 mod l hyperelliptic monodromy is symplectic](../packages/ArithmeticStatistics/README.md#mod-l-hyperelliptic-monodromy-is-symplectic) |

| core / 31 | Moduli of labelled stable hyperelliptic curves and clutching | [§5.17 hyperelliptic boundary degeneration](../packages/ArithmeticStatistics/README.md#hyperelliptic-boundary-degeneration) |

| core / 32 | Vasiu's surjectivity criterion for Sp_{2g} | [§5.17 integral lift of full mod l symplectic image](../packages/ArithmeticStatistics/README.md#integral-lift-of-full-mod-l-symplectic-image) |

| core / 33 | Generation of Sp(V) by symplectic transvections | [§5.17 overlapping symplectic subgroups generate](../packages/ArithmeticStatistics/README.md#overlapping-symplectic-subgroups-generate) |

| core / 34 | Schur–Zassenhaus conjugacy for nonabelian coprime H | [§5.22 counting unramified h extensions via semidirect extensions](../packages/ArithmeticStatistics/README.md#counting-unramified-h-extensions-via-semidirect-extensions); [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) |

| core / 35 | Second-order count of binary cubic forms (Bhargava-Shankar-Tsimerman Sections 6 and 9) is not an ST.2 node | [§3.5 roberts second order term for cubic fields](../packages/ArithmeticStatistics/README.md#roberts-second-order-term-for-cubic-fields); [§3.5 second order term for the mean of three torsion](../packages/ArithmeticStatistics/README.md#second-order-term-for-the-mean-of-three-torsion); [§3.5 second order term for cubic orders with local specifications](../packages/ArithmeticStatistics/README.md#second-order-term-for-cubic-orders-with-local-specifications) |

| core / 36 | Geometry of numbers for pairs of integral ternary quadratic forms (quartic rings) is not an ST.2 node | [§3.7 bhargava count of quartic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quartic-fields); [§3.7 bhargava mean of two torsion in cubic class groups](../packages/ArithmeticStatistics/README.md#bhargava-mean-of-two-torsion-in-cubic-class-groups) |

| core / 37 | Geometry of numbers for quadruples of quinary alternating forms (quintic rings) is not an ST.2 node | [§3.7 bhargava count of quintic fields](../packages/ArithmeticStatistics/README.md#bhargava-count-of-quintic-fields) |

| core / 38 | Orbit parametrisations of 3-, 4- and 5-Selmer elements are not ST.1 nodes | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) |

| core / 39 | Orbit counts for the 3-, 4- and 5-Selmer representations are not ST.2 nodes | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) |

| core / 40 | Parametrisation and counting for the second moment of Sel_2 (Bhargava-Shankar-Swaminathan) are not ST.1/ST.2 nodes | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group) |

| core / 41 | BKLOS parametrisation and counting over number fields are not ST.1/ST.2 nodes | [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups) |

| core / 42 | Lemke Oliver-Wang-Wood and Datskovsky-Wright results are not ST.3 nodes | [§5.2 cohen lenstra martinet average conjecture](../packages/ArithmeticStatistics/README.md#cohen-lenstra-martinet-average-conjecture); [§5.2 cohen martinet surjection moment conjecture](../packages/ArithmeticStatistics/README.md#cohen-martinet-surjection-moment-conjecture); [§5.2 dihedral quartic proven average versus prediction](../packages/ArithmeticStatistics/README.md#dihedral-quartic-proven-average-versus-prediction) |

| core / 43 | Shared carrier/API for Wood rigidification multiplicities | [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment); [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment); [§5.21 bad type normalization transfer](../packages/ArithmeticStatistics/README.md#bad-type-normalization-transfer) |

| core / 44 | Shared arithmetic-family interface for Wood exact discriminant slices | [§0.20 imaginary exact slice parametrization](../packages/ArithmeticStatistics/README.md#imaginary-exact-slice-parametrization); [§0.20 real exact slice parametrization](../packages/ArithmeticStatistics/README.md#real-exact-slice-parametrization); [§5.20 imaginary per component unit moment](../packages/ArithmeticStatistics/README.md#imaginary-per-component-unit-moment); [§5.20 real per component unit moment](../packages/ArithmeticStatistics/README.md#real-per-component-unit-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 bad type normalization transfer](../packages/ArithmeticStatistics/README.md#bad-type-normalization-transfer); [§5.21 printed bad type ordinary limit assertion](../packages/ArithmeticStatistics/README.md#printed-bad-type-ordinary-limit-assertion) |

| core / 45 | The family of principally polarized abelian varieties over F_p is not an ST.0 node | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 46 | Projection and spreading interfaces for the corrected geometric-sieve proof | [§2.1 lattice points on a subvariety in a dilated region](../packages/ArithmeticStatistics/README.md#lattice-points-on-a-subvariety-in-a-dilated-region); [§2.1 uniform bound for points of a subscheme modulo p](../packages/ArithmeticStatistics/README.md#uniform-bound-for-points-of-a-subscheme-modulo-p); [§2.1 geometric sieve large primes](../packages/ArithmeticStatistics/README.md#geometric-sieve-large-primes); [§2.1 strong divisibility lies on a codimension two locus](../packages/ArithmeticStatistics/README.md#strong-divisibility-lies-on-a-codimension-two-locus) |

| core / 47 | Native semialgebraic multiset interface in the cusp-count prototype | [§2.3 averaged count of binary quartic orbits](../packages/ArithmeticStatistics/README.md#averaged-count-of-binary-quartic-orbits); [§2.3 binary quartic lattice points in the cusp](../packages/ArithmeticStatistics/README.md#binary-quartic-lattice-points-in-the-cusp) |

| core / 48 | Unbound cross-part refinements | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group); [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups) |

| ST.0 / 0 | Positive general-number-field squareclass denominator | [§0.15 positive squareclass denominator](../packages/ArithmeticStatistics/README.md#twist-denominator-frontier) |

| ST.0 / 1 | General-rank binary discriminant, root and ring binding | [§0.14 odd root criterion](../packages/ArithmeticStatistics/README.md#odd-root-criterion); [§1.9 binary density formulas](../packages/ArithmeticStatistics/README.md#binary-density-formulas) |

| ST.0 / 2 | Polarized geometry and finite class counts | [§0.16 unpolarized abelian count](../packages/ArithmeticStatistics/README.md#unpolarized-abelian-count); [§0.16 principally polarized count](../packages/ArithmeticStatistics/README.md#principally-polarized-count); [§0.16 polarization fiber count](../packages/ArithmeticStatistics/README.md#polarization-fiber-count) |

| ST.0 / 3 | Picard, theta and adelic geometric specialization | [§0.18 theta tail normalization](../packages/ArithmeticStatistics/README.md#theta-tail-normalization); [§0.18 hecke pushforward](../packages/ArithmeticStatistics/README.md#hecke-pushforward); [§0.18 pointless curve regression](../packages/ArithmeticStatistics/README.md#pointless-curve-regression) |

| ST.0 / 4 | Full Wood split-infinity arithmetic binding | [§0.19 wood infinity and type adapter](../packages/ArithmeticStatistics/README.md#wood-infinity-and-type-adapter); [§0.21 wood average normalizations](../packages/ArithmeticStatistics/README.md#wood-average-normalizations) |

| ST.0 / 5 | Unbound cross-part refinements | [§0.12 local maximality](../packages/ArithmeticStatistics/README.md#local-maximality); [§0.14 hyperelliptic model family](../packages/ArithmeticStatistics/README.md#hyperelliptic-model-family); [§0.14 odd root criterion](../packages/ArithmeticStatistics/README.md#odd-root-criterion) |

| ST.1 / 0 | Nonétale rational quintic realization omitted in HCL IV | [§1.10 integral quintic realization](../packages/ArithmeticStatistics/README.md#refinement-integral-quintic-realization) |

| ST.1 / 1 | Symmetric-group closures and trace-dual comparison | [§1.10 nondegenerate resolvent comparison](../packages/ArithmeticStatistics/README.md#refinement-nondegenerate-resolvent-comparison); [§1.15 quartic etale resolvent](../packages/ArithmeticStatistics/README.md#refinement-quartic-etale-resolvent); [§1.15 quartic invariant index](../packages/ArithmeticStatistics/README.md#refinement-quartic-invariant-index) |

| ST.1 / 2 | Generalized Jacobians, Fano schemes and Selmer torsors | [§1.12 pencil existence](../packages/ArithmeticStatistics/README.md#refinement-pencil-existence); [§1.12 pencil fano torsor](../packages/ArithmeticStatistics/README.md#refinement-pencil-fano-torsor); [§1.12 locally soluble pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-locally-soluble-pencil-orbits); [§1.12 integral soluble pencils](../packages/ArithmeticStatistics/README.md#refinement-integral-soluble-pencils); [§1.16 good prime integral pencils](../packages/ArithmeticStatistics/README.md#refinement-good-prime-integral-pencils); [§1.12 common isotropic](../packages/ArithmeticStatistics/README.md#refinement-common-isotropic) |

| ST.1 / 3 | Group schemes and genus-one degree3–5 integral models | [§1.12 integral pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-integral-pencil-orbits); [§1.12 field pencil stabilizers](../packages/ArithmeticStatistics/README.md#refinement-field-pencil-stabilizers); [§1.14 genus one stabilizer schemes](../packages/ArithmeticStatistics/README.md#refinement-genus-one-stabilizer-schemes) |

| ST.1 / 4 | Even q polynomial and negative-index boundary | [§1.13 even weak lift](../packages/ArithmeticStatistics/README.md#refinement-even-weak-lift); [§1.12 oriented ideal triples](../packages/ArithmeticStatistics/README.md#refinement-oriented-ideal-triples) |

| ST.1 / 5 | Current upstream orthogonal and integral-lattice adapters | [§1.13 one matrix slice](../packages/ArithmeticStatistics/README.md#refinement-one-matrix-slice); [§1.8 integral minor fibres](../packages/ArithmeticStatistics/README.md#refinement-integral-minor-fibres); [§1.13 marked q](../packages/ArithmeticStatistics/README.md#refinement-marked-q) |

| ST.2 / 0 | Native arithmetic orbit interfaces | [§2.8 quartic finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-quartic-finite-congruence-count); [§2.9 quintic finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-quintic-finite-congruence-count); [§2.17 pencil finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-pencil-finite-congruence-count); [§2.18 ternary cubic finite count](../packages/ArithmeticStatistics/README.md#refinement-ternary-cubic-finite-count); [§2.19 quaternary finite count](../packages/ArithmeticStatistics/README.md#refinement-quaternary-finite-count); [§2.20 quinary finite count](../packages/ArithmeticStatistics/README.md#refinement-quinary-finite-count) |

| ST.2 / 1 | Quartic suborders, quadratic extension masses and transport | [§2.8 quartic fixed reducible resolvent](../packages/ArithmeticStatistics/README.md#refinement-quartic-fixed-reducible-resolvent); [§2.8 quartic nonmaximal overramified tail](../packages/ArithmeticStatistics/README.md#refinement-quartic-nonmaximal-overramified-tail) |

| ST.2 / 2 | Uniform quintic suborder input | [§2.9 quintic nonmaximal tail](../packages/ArithmeticStatistics/README.md#refinement-quintic-nonmaximal-tail) |

| ST.2 / 3 | Cubic second-term proof and local coefficients | [§2.11 cubic secondary congruence count](../packages/ArithmeticStatistics/README.md#refinement-cubic-secondary-congruence-count); [§2.11 cubic secondary sieve error](../packages/ArithmeticStatistics/README.md#refinement-cubic-secondary-sieve-error) |

| ST.2 / 4 | S-arithmetic orbit and geometric-sieve adapters | [§2.10 global field generic finite count](../packages/ArithmeticStatistics/README.md#refinement-global-field-generic-finite-count); [§2.10 global field large prime tail](../packages/ArithmeticStatistics/README.md#refinement-global-field-large-prime-tail); [§2.10 global field large local count](../packages/ArithmeticStatistics/README.md#refinement-global-field-large-local-count) |

| ST.2 / 5 | Weighted geometric sieve and nonzero monic error | [§2.13 monic strong tail](../packages/ArithmeticStatistics/README.md#refinement-monic-strong-tail); [§2.13 monic weak tail](../packages/ArithmeticStatistics/README.md#refinement-monic-weak-tail); [§2.13 monic fixed modulus sieve](../packages/ArithmeticStatistics/README.md#refinement-monic-fixed-modulus-sieve) |

| ST.2 / 6 | Even-degree binary-form repaired tail | [§2.16 even binary main shallow](../packages/ArithmeticStatistics/README.md#refinement-even-binary-main-shallow); [§2.16 even binary restricted gram](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-gram); [§2.16 even binary restricted deep tail](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-deep-tail); [§2.16 binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-binary-summed-tail); [§2.16 binary fixed modulus sieve](../packages/ArithmeticStatistics/README.md#refinement-binary-fixed-modulus-sieve) |

| ST.2 / 7 | Degree-two tails and finite-modulus sieve | [§2.13 monic summed tail](../packages/ArithmeticStatistics/README.md#refinement-monic-summed-tail); [§2.16 binary fixed modulus sieve](../packages/ArithmeticStatistics/README.md#refinement-binary-fixed-modulus-sieve); [§2.16 quadratic binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-quadratic-binary-summed-tail) |

| ST.2 / 8 | Representation-specific geometric-sieve hypotheses | [§2.14 invariant geometric sieve criterion](../packages/ArithmeticStatistics/README.md#refinement-invariant-geometric-sieve-criterion) |

| ST.2 / 9 | Integral genus-one models and local measures | [§2.18 ternary cubic finite count](../packages/ArithmeticStatistics/README.md#refinement-ternary-cubic-finite-count); [§2.19 quaternary finite count](../packages/ArithmeticStatistics/README.md#refinement-quaternary-finite-count); [§2.20 quinary finite count](../packages/ArithmeticStatistics/README.md#refinement-quinary-finite-count); [§2.17 pencil finite congruence count](../packages/ArithmeticStatistics/README.md#refinement-pencil-finite-congruence-count) |

| ST.2 / 10 | Smooth unfolding and special quaternary masses | [§2.21 smoothed orbit unfolding](../packages/ArithmeticStatistics/README.md#refinement-smoothed-orbit-unfolding); [§2.21 smoothed quaternary count](../packages/ArithmeticStatistics/README.md#refinement-smoothed-quaternary-count) |

| ST.2 / 11 | Unavailable coregular number-field count | [§2.22 number field twist orbit count](../packages/ArithmeticStatistics/README.md#refinement-number-field-twist-orbit-count) |

| ST.2 / 12 | Hypersurface coefficient geometry and ball density | [§2.23 hypersurface local tail](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-local-tail); [§2.23 hypersurface finite local count](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-finite-local-count); [§2.23 hypersurface local density](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-local-density) |

| ST.3 / 0 | Geometric-zero growth lemma | [§3.22 rank moments determine rank law](../packages/ArithmeticStatistics/README.md#rank-moments-determine-rank-law) |

| ST.3 / 1 | Native cubic secondary density interface | [§3.20 cubic secondary orbit integral](../packages/ArithmeticStatistics/README.md#cubic-secondary-orbit-integral) |

| ST.3 / 2 | Ring-class conductor normalization | [§3.19 cubic conductor discriminant](../packages/ArithmeticStatistics/README.md#cubic-conductor-discriminant); [§3.19 quadratic order three torsion bound](../packages/ArithmeticStatistics/README.md#quadratic-order-three-torsion-bound) |

| ST.3 / 3 | Cubic order identity over a fixed resolvent | [§3.25 relative three torsion propagation](../packages/ArithmeticStatistics/README.md#relative-three-torsion-propagation) |

| ST.3 / 4 | Native reduced-multiplier and arithmetic-lift exports | [§3.27 nonabelian quadratic moment interface](../packages/ArithmeticStatistics/README.md#nonabelian-quadratic-moment-interface); [§3.27 embedded type catalogue](../packages/ArithmeticStatistics/README.md#embedded-type-catalogue); [§3.27 nonabelian admissibility and abelianization](../packages/ArithmeticStatistics/README.md#nonabelian-admissibility-and-abelianization) |

| ST.3 / 5 | Arithmetic nonabelian moment signatures | [§3.27 nonabelian quadratic moment interface](../packages/ArithmeticStatistics/README.md#nonabelian-quadratic-moment-interface); [§3.27 a4 appendix kernel enumerator](../packages/ArithmeticStatistics/README.md#a4-appendix-kernel-enumerator) |

| ST.3 / 6 | Alberts original classification and residue inputs | [§3.27 nonabelian low degree known moments](../packages/ArithmeticStatistics/README.md#nonabelian-low-degree-known-moments) |

| ST.3 / 7 | Mixed-trace algebraic geometry input | [§3.28 mixed trace finite fibres](../packages/ArithmeticStatistics/README.md#mixed-trace-finite-fibres) |

| ST.3 / 8 | Original abelian and quartic counting proofs | [§3.29 cyclic prime field count](../packages/ArithmeticStatistics/README.md#cyclic-prime-field-count); [§3.29 baily weighted quartic count](../packages/ArithmeticStatistics/README.md#baily-weighted-quartic-count) |

| ST.3 / 9 | Original governing-field criteria | [§3.30 eight rank governing field](../packages/ArithmeticStatistics/README.md#eight-rank-governing-field); [§3.30 sixteen rank spin criterion](../packages/ArithmeticStatistics/README.md#sixteen-rank-spin-criterion) |

| ST.3 / 10 | Original Pell bounds and height transfer | [§3.31 negative pell historical bounds](../packages/ArithmeticStatistics/README.md#negative-pell-historical-bounds); [§3.31 restricted real quadratic family](../packages/ArithmeticStatistics/README.md#restricted-real-quadratic-family) |

| ST.3 / 11 | Real-metric lattice reduction supplier | [§3.32 polynomial order lattice reduction](../packages/ArithmeticStatistics/README.md#polynomial-order-lattice-reduction); [§3.32 monic weak quasi reduction](../packages/ArithmeticStatistics/README.md#monic-weak-quasi-reduction) |

| ST.3 / 12 | Polynomial-to-field bounded multiplicity | [§3.33 monogenic field lower bound target](../packages/ArithmeticStatistics/README.md#monogenic-field-lower-bound-target); [§3.34 binary form field lower bound target](../packages/ArithmeticStatistics/README.md#binary-form-field-lower-bound-target) |

| ST.3 / 13 | Restricted polynomial densities and general binary-order interfaces | [§3.32 trace restricted polynomial sieve](../packages/ArithmeticStatistics/README.md#trace-restricted-polynomial-sieve); [§3.32 polynomial order lattice reduction](../packages/ArithmeticStatistics/README.md#polynomial-order-lattice-reduction); [§3.34 binary form arithmetic bertini](../packages/ArithmeticStatistics/README.md#binary-form-arithmetic-bertini); [§3.34 binary form sieve counts](../packages/ArithmeticStatistics/README.md#binary-form-sieve-counts) |

| ST.3 / 14 | Nakagawa restoration | [§3.34 unramified alternating extension lower bound target](../packages/ArithmeticStatistics/README.md#unramified-alternating-extension-lower-bound-target) |

| ST.3 / 15 | Abelian and classical counting originals | [§3.29 cyclic prime field count](../packages/ArithmeticStatistics/README.md#cyclic-prime-field-count); [§3.29 baily weighted quartic count](../packages/ArithmeticStatistics/README.md#baily-weighted-quartic-count); [§3.35 all fields degree at most five](../packages/ArithmeticStatistics/README.md#all-fields-degree-at-most-five); [§3.36 kluners cyclotomic subfamily](../packages/ArithmeticStatistics/README.md#kluners-cyclotomic-subfamily) |

| ST.3 / 16 | Historical Galois-bound exceptional inputs | [§3.29 galois field three eighths bound](../packages/ArithmeticStatistics/README.md#galois-field-three-eighths-bound) |

| ST.3 / 17 | Classical binary quadratic orbit counts | [§3.6 mertens count of positive definite binary quadratic forms](../packages/ArithmeticStatistics/README.md#mertens-count-of-positive-definite-binary-quadratic-forms); [§3.6 siegel count of indefinite binary quadratic forms](../packages/ArithmeticStatistics/README.md#siegel-count-of-indefinite-binary-quadratic-forms); [§3.6 quoted classical counts for binary quadratic and cubic forms](../packages/ArithmeticStatistics/README.md#quoted-classical-counts-for-binary-quadratic-and-cubic-forms) |

| ST.3 / 18 | Catalogue computation certificates | [§3.27 embedded type catalogue](../packages/ArithmeticStatistics/README.md#embedded-type-catalogue) |

| ST.3 / 19 | Narrow relative norm and base-character filters | [§3.23 relative torsion splitting](../packages/ArithmeticStatistics/README.md#relative-torsion-splitting); [§3.24 quartic class group two torsion fibre](../packages/ArithmeticStatistics/README.md#quartic-class-group-two-torsion-fibre); [§3.24 low degree class group mass ratios](../packages/ArithmeticStatistics/README.md#low-degree-class-group-mass-ratios) |

| ST.3 / 20 | Rank-marginal moment uniqueness export | [§3.22 rank moments determine rank law](../packages/ArithmeticStatistics/README.md#rank-moments-determine-rank-law) |

| ST.4 / 0 | Native geometric suggested signatures | [§4.15 degree one arithmetic comparison](../packages/ArithmeticStatistics/README.md#refinement-degree-one-arithmetic-comparison); [§4.15 generic weierstrass class](../packages/ArithmeticStatistics/README.md#refinement-generic-weierstrass-class); [§4.15 pencil local global weight](../packages/ArithmeticStatistics/README.md#refinement-pencil-local-global-weight); [§4.15 pencil selmer weighted count](../packages/ArithmeticStatistics/README.md#refinement-pencil-selmer-weighted-count); [§4.16 hyperelliptic local mass ratio](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-local-mass-ratio); [§4.16 pencil measure comparison](../packages/ArithmeticStatistics/README.md#refinement-pencil-measure-comparison); [§4.16 tamagawa central quotient](../packages/ArithmeticStatistics/README.md#refinement-tamagawa-central-quotient); [§4.16 hyperelliptic weighted upper bound](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-weighted-upper-bound); [§4.19 hyperelliptic average two](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-average-two); [§4.17 real effective divisor image](../packages/ArithmeticStatistics/README.md#refinement-real-effective-divisor-image); [§4.20 order k strict average](../packages/ArithmeticStatistics/README.md#refinement-order-k-strict-average); [§4.20 order k vanishing average](../packages/ArithmeticStatistics/README.md#refinement-order-k-vanishing-average); [§4.20 small odd degree points disappear](../packages/ArithmeticStatistics/README.md#refinement-small-odd-degree-points-disappear); [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity); [§4.18 biquadratic parity formula](../packages/ArithmeticStatistics/README.md#refinement-biquadratic-parity-formula); [§4.18 four twist local parity](../packages/ArithmeticStatistics/README.md#refinement-four-twist-local-parity); [§4.18 mod eight parity family](../packages/ArithmeticStatistics/README.md#refinement-mod-eight-parity-family); [§4.18 odd residue field models](../packages/ArithmeticStatistics/README.md#refinement-odd-residue-field-models); [§4.18 full family corank parities](../packages/ArithmeticStatistics/README.md#refinement-full-family-corank-parities); [§4.18 admissible family selmer parities](../packages/ArithmeticStatistics/README.md#refinement-admissible-family-selmer-parities); [§4.21 positive empty selmer set](../packages/ArithmeticStatistics/README.md#refinement-positive-empty-selmer-set); [§4.21 positive index two](../packages/ArithmeticStatistics/README.md#refinement-positive-index-two); [§4.21 positive nontrivial sha two](../packages/ArithmeticStatistics/README.md#refinement-positive-nontrivial-sha-two); [§4.21 degree one points empty or infinite](../packages/ArithmeticStatistics/README.md#refinement-degree-one-points-empty-or-infinite); [§4.21 corrected two prime criterion](../packages/ArithmeticStatistics/README.md#refinement-corrected-two-prime-criterion); [§4.22 rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-rank-one-selmer-criterion); [§4.22 twisted rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-twisted-rank-one-selmer-criterion); [§4.22 rank one family properties](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family-properties); [§4.22 local five quotient comparison](../packages/ArithmeticStatistics/README.md#refinement-local-five-quotient-comparison); [§4.22 five selmer local equidistribution](../packages/ArithmeticStatistics/README.md#refinement-five-selmer-local-equidistribution); [§4.23 rank one torsion image bound](../packages/ArithmeticStatistics/README.md#refinement-rank-one-torsion-image-bound); [§4.23 rank one saturated count](../packages/ArithmeticStatistics/README.md#refinement-rank-one-saturated-count); [§4.23 positive simultaneous rank one](../packages/ArithmeticStatistics/README.md#refinement-positive-simultaneous-rank-one); [§4.24 soluble generic three selmer elements](../packages/ArithmeticStatistics/README.md#refinement-soluble-generic-three-selmer-elements); [§4.24 plane cubic height and orbit transfer](../packages/ArithmeticStatistics/README.md#refinement-plane-cubic-height-and-orbit-transfer); [§4.24 soluble ternary fundamental count](../packages/ArithmeticStatistics/README.md#refinement-soluble-ternary-fundamental-count) |

| ST.4 / 1 | Reduction-only largeness does not justify the printed tail | [§4.19 hyperelliptic average two](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-average-two); [§4.21 corrected two prime criterion](../packages/ArithmeticStatistics/README.md#refinement-corrected-two-prime-criterion) |

| ST.4 / 2 | The routed rank-one converse has no registered export | [§4.22 rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-rank-one-selmer-criterion); [§4.22 twisted rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-twisted-rank-one-selmer-criterion) |

| ST.4 / 3 | General central-isogeny volume calculation is not supplied | [§4.16 tamagawa central quotient](../packages/ArithmeticStatistics/README.md#refinement-tamagawa-central-quotient); [§4.16 hyperelliptic weighted upper bound](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-weighted-upper-bound) |

| ST.4 / 4 | Uniform denominator in the growing-genus limit | [§4.20 order k vanishing average](../packages/ArithmeticStatistics/README.md#refinement-order-k-vanishing-average); [§4.20 small odd degree points disappear](../packages/ArithmeticStatistics/README.md#refinement-small-odd-degree-points-disappear) |

| ST.4 / 5 | Number-field height/sieve transfer is not verified | [§4.18 admissible family selmer parities](../packages/ArithmeticStatistics/README.md#refinement-admissible-family-selmer-parities) |

| ST.5 / 0 | Topological quadratic reductions and projective measure | [§5.26 lc finite reductions](../packages/ArithmeticStatistics/README.md#refinement-lc-finite-reductions); [§5.26 lc canonical measure](../packages/ArithmeticStatistics/README.md#refinement-lc-canonical-measure); [§5.26 lc random intersection](../packages/ArithmeticStatistics/README.md#refinement-lc-random-intersection); [§5.26 lc restricted product](../packages/ArithmeticStatistics/README.md#refinement-lc-restricted-product) |

| ST.5 / 1 | Finite-flat theta obstruction and global duality | [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection); [§5.27 sha one vanishing](../packages/ArithmeticStatistics/README.md#refinement-sha-one-vanishing); [§5.31 kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-kummer-direct-summand); [§5.31 adelic kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-adelic-kummer-direct-summand) |

| ST.5 / 2 | Integral orthogonal geometry and Oesterlé proof inputs | [§5.29 smooth cylinder measure](../packages/ArithmeticStatistics/README.md#refinement-smooth-cylinder-measure); [§5.29 ogr smooth projective](../packages/ArithmeticStatistics/README.md#refinement-ogr-smooth-projective); [§5.29 ogr components](../packages/ArithmeticStatistics/README.md#refinement-ogr-components); [§5.29 ogr schubert dimension](../packages/ArithmeticStatistics/README.md#refinement-ogr-schubert-dimension) |

| ST.5 / 3 | Analytic coefficient and bounded-exponent moment interfaces | [§3.38 wood grid separator](../packages/ArithmeticStatistics/README.md#refinement-wood-grid-separator); [§3.38 wood coefficient bound](../packages/ArithmeticStatistics/README.md#refinement-wood-coefficient-bound); [§3.38 wood subgroup bound](../packages/ArithmeticStatistics/README.md#refinement-wood-subgroup-bound); [§3.38 wood grid uniqueness](../packages/ArithmeticStatistics/README.md#refinement-wood-grid-uniqueness); [§3.38 wood bounded moment limit](../packages/ArithmeticStatistics/README.md#refinement-wood-bounded-moment-limit) |

| ST.5 / 4 | From bounded exponents to the parent full Cohen–Lenstra law | [§3.13 moments determine cohen lenstra limits for all p and u](../packages/ArithmeticStatistics/README.md#moments-determine-cohen-lenstra-limits-for-all-p-and-u) |

| ST.5 / 5 | Selmer descent-to-count comparison | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) |

| ST.5 / 6 | BSS even-degree and sparse-count closure | [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average); [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group) |

| ST.5 / 7 | Special analytic nonvanishing proof and generic residual input | [§4.25 analytic rank zero criterion](../packages/ArithmeticStatistics/README.md#refinement-analytic-rank-zero-criterion); [§4.25 positive analytic rank zero](../packages/ArithmeticStatistics/README.md#refinement-positive-analytic-rank-zero); [§4.25 positive weak bsd](../packages/ArithmeticStatistics/README.md#refinement-positive-weak-bsd) |

| ST.5 / 8 | Certified root-balanced family density | [§4.27 five root balanced family](../packages/ArithmeticStatistics/README.md#refinement-five-root-balanced-family); [§4.27 five full average rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-average-rank); [§4.27 five full low rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-low-rank); [§4.27 five full rank zero](../packages/ArithmeticStatistics/README.md#refinement-five-full-rank-zero) |

| ST.5 / 9 | Number-field coregular twist count | [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound); [§5.32 multiplication three rank bound](../packages/ArithmeticStatistics/README.md#refinement-multiplication-three-rank-bound); [§5.32 finite extension rank bound](../packages/ArithmeticStatistics/README.md#refinement-finite-extension-rank-bound); [§5.32 elliptic explicit twist rank](../packages/ArithmeticStatistics/README.md#refinement-elliptic-explicit-twist-rank) |

| ST.5 / 10 | Unrestricted BKLOS endomorphism rank claim | [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound) |

| ST.5 / 11 | Local3-isogeny and Cassels–Tate proof ownership | [§5.10 three isogeny selmer parity](../packages/ArithmeticStatistics/README.md#three-isogeny-selmer-parity); [§5.10 tamagawa ratio under potentially good reduction](../packages/ArithmeticStatistics/README.md#tamagawa-ratio-under-potentially-good-reduction); [§5.32 signature positive twists](../packages/ArithmeticStatistics/README.md#refinement-signature-positive-twists); [§5.32 complex place obstruction](../packages/ArithmeticStatistics/README.md#refinement-complex-place-obstruction) |

| ST.5 / 12 | Full-two-torsion twist law analytic inputs | [§5.9 two selmer distribution in full two torsion twist families](../packages/ArithmeticStatistics/README.md#two-selmer-distribution-in-full-two-torsion-twist-families) |

| ST.5 / 13 | Primary de Jong function-field verification | [§5.9 function field 3 selmer average bound](../packages/ArithmeticStatistics/README.md#function-field-3-selmer-average-bound) |

| ST.5 / 14 | Retained random-group and function-field frontiers | [§5.2 dihedral quartic proven average versus prediction](../packages/ArithmeticStatistics/README.md#dihedral-quartic-proven-average-versus-prediction); [§5.3 enhanced cohen lenstra finite level law](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-finite-level-law); [§5.3 enhanced cohen lenstra conjecture](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-conjecture); [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law); [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs); [§5.19 large q cohen lenstra theorem](../packages/ArithmeticStatistics/README.md#large-q-cohen-lenstra-theorem); [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment); [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 bad type normalization transfer](../packages/ArithmeticStatistics/README.md#bad-type-normalization-transfer); [§5.21 printed bad type ordinary limit assertion](../packages/ArithmeticStatistics/README.md#printed-bad-type-ordinary-limit-assertion); [§5.22 counting unramified h extensions via semidirect extensions](../packages/ArithmeticStatistics/README.md#counting-unramified-h-extensions-via-semidirect-extensions); [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) |

| ST.5 / 15 | Global coefficient-height family adapters | [§5.28 squarefree selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-squarefree-selmer-conjecture); [§5.28 odd degree jacobian conjecture](../packages/ArithmeticStatistics/README.md#refinement-odd-degree-jacobian-conjecture); [§5.28 even genus two selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-even-genus-two-selmer-conjecture); [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture) |

| ST.5 / 16 | Native arithmetic and geometric signatures | [§5.26 lc finite reductions](../packages/ArithmeticStatistics/README.md#refinement-lc-finite-reductions); [§5.26 lc canonical measure](../packages/ArithmeticStatistics/README.md#refinement-lc-canonical-measure); [§5.26 lc random intersection](../packages/ArithmeticStatistics/README.md#refinement-lc-random-intersection); [§5.26 lc restricted product](../packages/ArithmeticStatistics/README.md#refinement-lc-restricted-product); [§5.27 sha one vanishing](../packages/ArithmeticStatistics/README.md#refinement-sha-one-vanishing); [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection); [§5.28 squarefree selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-squarefree-selmer-conjecture); [§5.28 odd degree jacobian conjecture](../packages/ArithmeticStatistics/README.md#refinement-odd-degree-jacobian-conjecture); [§5.28 even genus two selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-even-genus-two-selmer-conjecture); [§5.29 smooth cylinder measure](../packages/ArithmeticStatistics/README.md#refinement-smooth-cylinder-measure); [§5.29 ogr smooth projective](../packages/ArithmeticStatistics/README.md#refinement-ogr-smooth-projective); [§5.29 ogr components](../packages/ArithmeticStatistics/README.md#refinement-ogr-components); [§5.29 ogr prime power count](../packages/ArithmeticStatistics/README.md#refinement-ogr-prime-power-count); [§5.29 ogr schubert dimension](../packages/ArithmeticStatistics/README.md#refinement-ogr-schubert-dimension); [§5.30 all rank delaunay](../packages/ArithmeticStatistics/README.md#refinement-all-rank-delaunay); [§5.30 positive rank all primes](../packages/ArithmeticStatistics/README.md#refinement-positive-rank-all-primes); [§5.30 rank zero all primes infinite](../packages/ArithmeticStatistics/README.md#refinement-rank-zero-all-primes-infinite); [§5.30 symplectic harmonic weights](../packages/ArithmeticStatistics/README.md#refinement-symplectic-harmonic-weights); [§5.30 sparse prime weighted limit](../packages/ArithmeticStatistics/README.md#refinement-sparse-prime-weighted-limit); [§5.31 injection moment conjecture](../packages/ArithmeticStatistics/README.md#refinement-injection-moment-conjecture); [§5.31 kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-kummer-direct-summand); [§5.31 adelic kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-adelic-kummer-direct-summand); [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture); [§5.31 trivial action global splitting](../packages/ArithmeticStatistics/README.md#refinement-trivial-action-global-splitting); [§3.38 wood coefficient bound](../packages/ArithmeticStatistics/README.md#refinement-wood-coefficient-bound); [§3.38 wood subgroup bound](../packages/ArithmeticStatistics/README.md#refinement-wood-subgroup-bound); [§3.38 wood bounded moment limit](../packages/ArithmeticStatistics/README.md#refinement-wood-bounded-moment-limit); [§4.25 balanced three rank zero](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-zero); [§4.25 balanced three rank one](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-one); [§4.25 positive three ranks](../packages/ArithmeticStatistics/README.md#refinement-positive-three-ranks); [§4.25 analytic rank zero criterion](../packages/ArithmeticStatistics/README.md#refinement-analytic-rank-zero-criterion); [§4.25 positive analytic rank zero](../packages/ArithmeticStatistics/README.md#refinement-positive-analytic-rank-zero); [§4.25 positive weak bsd](../packages/ArithmeticStatistics/README.md#refinement-positive-weak-bsd); [§4.26 two selmer nonlift](../packages/ArithmeticStatistics/README.md#refinement-two-selmer-nonlift); [§4.27 five basic bounds](../packages/ArithmeticStatistics/README.md#refinement-five-basic-bounds); [§4.27 five balanced bounds](../packages/ArithmeticStatistics/README.md#refinement-five-balanced-bounds); [§4.27 five root balanced family](../packages/ArithmeticStatistics/README.md#refinement-five-root-balanced-family); [§4.27 five full average rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-average-rank); [§4.27 five full low rank](../packages/ArithmeticStatistics/README.md#refinement-five-full-low-rank); [§4.27 five full rank zero](../packages/ArithmeticStatistics/README.md#refinement-five-full-rank-zero); [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average); [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound); [§5.32 multiplication three rank bound](../packages/ArithmeticStatistics/README.md#refinement-multiplication-three-rank-bound); [§5.32 finite extension rank bound](../packages/ArithmeticStatistics/README.md#refinement-finite-extension-rank-bound); [§5.32 elliptic explicit twist rank](../packages/ArithmeticStatistics/README.md#refinement-elliptic-explicit-twist-rank); [§5.32 signature positive twists](../packages/ArithmeticStatistics/README.md#refinement-signature-positive-twists); [§5.32 complex place obstruction](../packages/ArithmeticStatistics/README.md#refinement-complex-place-obstruction) |

| ST.5 / 17 | Unbound cross-part refinements | [§5.28 squarefree selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-squarefree-selmer-conjecture); [§5.28 odd degree jacobian conjecture](../packages/ArithmeticStatistics/README.md#refinement-odd-degree-jacobian-conjecture); [§5.28 even genus two selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-even-genus-two-selmer-conjecture); [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture); [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average) |

## Supplier-request routing

The 143 accepted requests remain indexed here. Native/general constructions are consumed through Scope and Exact supplier contracts; local support specializations are owned as in the moves table. Internal requests resolve to the conservation inventory rather than introducing a second owner. The links identify the consuming assertions whose hypotheses require the contract. For the full original contract use the corresponding zero-based request entry in the named unchanged packet.

| Packet / request index | Original supplier | Current route | Consumers |
|---|---|---|---|

| core / 0 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters` | TauCetiRoadmap.EllipticCurves Layer 8 | [§0.4 elliptic curves over q ordered by height](../packages/ArithmeticStatistics/README.md#elliptic-curves-over-q-ordered-by-height); [§0.4 quartic to curve height normalisation](../packages/ArithmeticStatistics/README.md#quartic-to-curve-height-normalisation); [§0.4 elliptic families defined by congruence conditions](../packages/ArithmeticStatistics/README.md#elliptic-families-defined-by-congruence-conditions); [§0.4 all elliptic curves form a large family](../packages/ArithmeticStatistics/README.md#all-elliptic-curves-form-a-large-family); [§0.4 invariants height and eligible pairs](../packages/ArithmeticStatistics/README.md#invariants-height-and-eligible-pairs) |

| core / 1 | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy` | TauCetiRoadmap.GlobalQuadraticForms Layer 5 | [§1.6 locally soluble quartics and the two selmer group](../packages/ArithmeticStatistics/README.md#locally-soluble-quartics-and-the-two-selmer-group); [§1.7 binary quartic parametrization of two selmer](../packages/ArithmeticStatistics/README.md#binary-quartic-parametrization-of-two-selmer) |

| core / 2 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii` | TauCetiRoadmap.EllipticCurves Layer 6 | [§1.7 binary quartic parametrization of two selmer](../packages/ArithmeticStatistics/README.md#binary-quartic-parametrization-of-two-selmer) |

| core / 3 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4` | TauCetiRoadmap.EllipticCurves Layer 7 | [§1.7 comparison with the cohomological two selmer group](../packages/ArithmeticStatistics/README.md#comparison-with-the-cohomological-two-selmer-group) |

| core / 4 | `DiophantineApproximationAndTranscendence:DT.4` | DiophantineApproximationAndTranscendence:DT.4 | [§1.8 fibres of the embedding are uniformly bounded](../packages/ArithmeticStatistics/README.md#fibres-of-the-embedding-are-uniformly-bounded) |

| core / 5 | `GeometryOfNumbersAndQuadraticArithmetic:GN.4` | GeometryOfNumbersAndQuadraticArithmetic:GN.4 | [§2.3 binary quartic lattice points in the cusp](../packages/ArithmeticStatistics/README.md#binary-quartic-lattice-points-in-the-cusp); [§2.4 eligible invariant pairs of bounded height](../packages/ArithmeticStatistics/README.md#eligible-invariant-pairs-of-bounded-height); [§2.6 binary cubic lattice points in the cusp](../packages/ArithmeticStatistics/README.md#binary-cubic-lattice-points-in-the-cusp) |

| core / 6 | `AnalyticNumberTheory:AN.5` | AnalyticNumberTheory:AN.5 | [§2.3 reducible binary quartic forms in the main body](../packages/ArithmeticStatistics/README.md#reducible-binary-quartic-forms-in-the-main-body); [§2.3 reducible monic binary cubic forms](../packages/ArithmeticStatistics/README.md#reducible-monic-binary-cubic-forms); [§2.6 reducible binary cubic forms in the main body](../packages/ArithmeticStatistics/README.md#reducible-binary-cubic-forms-in-the-main-body) |

| core / 7 | `AnalyticNumberTheory:AN.8` | AnalyticNumberTheory:AN.8 | [§3.4 p adic density of a local specification](../packages/ArithmeticStatistics/README.md#p-adic-density-of-a-local-specification) |

| core / 8 | `tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-0-the-permutation-representation-of-a-polynomial` | TauCetiRoadmap.PolynomialGaloisGroups Layer 0 | [§3.1 number field counting function](../packages/ArithmeticStatistics/README.md#number-field-counting-function) |

| core / 9 | `tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-6-transitive-subgroups-of-sₙ-for-n--5-and-the-label-predicates` | TauCetiRoadmap.PolynomialGaloisGroups Layer 6 | [§3.1 number field counting function](../packages/ArithmeticStatistics/README.md#number-field-counting-function) |

| core / 10 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | TauCetiRoadmap.ClassFieldTheory Layer 13 | [§3.3 three torsion of quadratic class groups counts cubic fields](../packages/ArithmeticStatistics/README.md#three-torsion-of-quadratic-class-groups-counts-cubic-fields); [§3.3 cubic fields totally ramified at large primes are sparse](../packages/ArithmeticStatistics/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse) |

| core / 11 | `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups` | TauCetiRoadmap.GlobalNumberFields Layer 11 | [§3.3 cubic fields totally ramified at large primes are sparse](../packages/ArithmeticStatistics/README.md#cubic-fields-totally-ramified-at-large-primes-are-sparse) |

| core / 12 | `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences` | TauCetiRoadmap.NumberFieldArithmetic Layer 6 | [§3.3 nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](../packages/ArithmeticStatistics/README.md#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent) |

| core / 13 | `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration` | TauCetiRoadmap.LocalFieldsRamification Layer 3 | [§3.3 nowhere totally ramified cubic fields and unramified cubic extensions of the resolvent](../packages/ArithmeticStatistics/README.md#nowhere-totally-ramified-cubic-fields-and-unramified-cubic-extensions-of-the-resolvent) |

| core / 14 | `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary` | TauCetiRoadmap.NumberFieldArithmetic Layer 1 | [§3.2 splitting symbol determines the reduction mod p](../packages/ArithmeticStatistics/README.md#splitting-symbol-determines-the-reduction-mod-p) |

| core / 15 | `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant` | TauCetiRoadmap.NumberFieldArithmetic Layer 4 | [§3.7 bhargava shankar wang counts over number fields](../packages/ArithmeticStatistics/README.md#bhargava-shankar-wang-counts-over-number-fields) |

| core / 16 | `tauceti:TauCetiRoadmap/ModularForms#layer-11-the-eichlerselberg-trace-formula-level-one` | TauCetiRoadmap.ModularForms Layer 11 | [§3.6 mertens count of positive definite binary quadratic forms](../packages/ArithmeticStatistics/README.md#mertens-count-of-positive-definite-binary-quadratic-forms) |

| core / 17 | `tauceti:TauCetiRoadmap/Multiquadratic#layer-0-the-multiquadratic-field` | TauCetiRoadmap.Multiquadratic Layer 0 | [§3.3 count of quadratic fields](../packages/ArithmeticStatistics/README.md#count-of-quadratic-fields) |

| core / 18 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4` | TauCetiRoadmap.EllipticCurves Layer 7 | [§4.7 selmer count as weighted orbit count](../packages/ArithmeticStatistics/README.md#selmer-count-as-weighted-orbit-count); [§4.10 average size of the 2 selmer group is three](../packages/ArithmeticStatistics/README.md#average-size-of-the-2-selmer-group-is-three); [§4.11 two selmer rank identity](../packages/ArithmeticStatistics/README.md#two-selmer-rank-identity); [§4.11 average two rank of sha is at most three halves](../packages/ArithmeticStatistics/README.md#average-two-rank-of-sha-is-at-most-three-halves) |

| core / 19 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii` | TauCetiRoadmap.EllipticCurves Layer 6 | [§4.11 two selmer rank identity](../packages/ArithmeticStatistics/README.md#two-selmer-rank-identity) |

| core / 20 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | TauCetiRoadmap.EllipticCurves Layer 4 | [§4.6 local two descent index](../packages/ArithmeticStatistics/README.md#local-two-descent-index); [§4.10 families of theorems 1 1 and 1 3 have positive local masses](../packages/ArithmeticStatistics/README.md#families-of-theorems-1-1-and-1-3-have-positive-local-masses) |

| core / 21 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-8-selected-ℚ-specific-database-adapters` | TauCetiRoadmap.EllipticCurves Layer 8 | [§4.8 count of curves in a large family](../packages/ArithmeticStatistics/README.md#count-of-curves-in-a-large-family) |

| core / 22 | `SelmerIwasawaCohomology:L2` | SelmerIwasawaCohomology:L2 | [§5.9 p infinity selmer corank distribution in twist families](../packages/ArithmeticStatistics/README.md#p-infinity-selmer-corank-distribution-in-twist-families); [§5.9 smith selmer rank limit equals corank](../packages/ArithmeticStatistics/README.md#smith-selmer-rank-limit-equals-corank); [§5.10 reduced p selmer rank bounds the corank](../packages/ArithmeticStatistics/README.md#reduced-p-selmer-rank-bounds-the-corank); [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half); [§5.8 bklpr selmer conjecture](../packages/ArithmeticStatistics/README.md#bklpr-selmer-conjecture) |

| core / 23 | `SelmerIwasawaCohomology:L4` | SelmerIwasawaCohomology:L4 | [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law) |

| core / 24 | `SelmerIwasawaCohomology:L1` | SelmerIwasawaCohomology:L1 | [§5.10 cassels isogeny selmer ratio formula](../packages/ArithmeticStatistics/README.md#cassels-isogeny-selmer-ratio-formula) |

| core / 25 | `ArithmeticGaloisDuality:R02.4` | ArithmeticGaloisDuality:R02.4 | [§5.10 cassels isogeny selmer ratio formula](../packages/ArithmeticStatistics/README.md#cassels-isogeny-selmer-ratio-formula) |

| core / 26 | `ComplexMultiplicationAndExplicitReciprocity:CM.1` | [CM twist and descent estimates](#support-cm) | [§5.11 cm three isogeny has selmer ratio one](../packages/ArithmeticStatistics/README.md#cm-three-isogeny-has-selmer-ratio-one); [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half); [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction) |

| core / 27 | `ComplexMultiplicationAndExplicitReciprocity:CM.3` | [CM twist and descent estimates](#support-cm) | [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction) |

| core / 28 | `InverseGaloisAndArithmeticFundamentalGroups:IG.2` | InverseGaloisAndArithmeticFundamentalGroups:IG.2 | [§4.13 rational p torsion has density zero](../packages/ArithmeticStatistics/README.md#rational-p-torsion-has-density-zero) |

| core / 29 | `SieveMethodsAndPrimePatterns:SV.2` | [coefficient sieves](#support-sieves) and [quadratic character-sum bounds](#support-character-sums) | [§5.9 two selmer distribution in full two torsion twist families](../packages/ArithmeticStatistics/README.md#two-selmer-distribution-in-full-two-torsion-twist-families) |

| core / 30 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv` | TauCetiRoadmap.EllipticCurves Layer 1 | [§5.10 local selmer ratio via tamagawa numbers](../packages/ArithmeticStatistics/README.md#local-selmer-ratio-via-tamagawa-numbers); [§5.11 cm three isogeny has selmer ratio one](../packages/ArithmeticStatistics/README.md#cm-three-isogeny-has-selmer-ratio-one); [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half) |

| core / 31 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv` | TauCetiRoadmap.EllipticCurves Layer 4 | [§5.10 local selmer ratio via tamagawa numbers](../packages/ArithmeticStatistics/README.md#local-selmer-ratio-via-tamagawa-numbers); [§5.10 tamagawa ratio under potentially good reduction](../packages/ArithmeticStatistics/README.md#tamagawa-ratio-under-potentially-good-reduction); [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction) |

| core / 32 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5` | TauCetiRoadmap.EllipticCurves Layer 5 | [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law); [§5.10 finitely many twists with rational p torsion](../packages/ArithmeticStatistics/README.md#finitely-many-twists-with-rational-p-torsion); [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction); [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half) |

| core / 33 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii` | TauCetiRoadmap.EllipticCurves Layer 6 | [§5.8 selmer average conjecture implies rank at most one](../packages/ArithmeticStatistics/README.md#selmer-average-conjecture-implies-rank-at-most-one) |

| core / 34 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4` | TauCetiRoadmap.EllipticCurves Layer 7 | [§4.14 average rank bound from the 3 selmer average](../packages/ArithmeticStatistics/README.md#average-rank-bound-from-the-3-selmer-average); [§5.8 selmer average conjecture implies rank at most one](../packages/ArithmeticStatistics/README.md#selmer-average-conjecture-implies-rank-at-most-one); [§5.8 bklpr conjecture implies rank and selmer laws](../packages/ArithmeticStatistics/README.md#bklpr-conjecture-implies-rank-and-selmer-laws); [§5.9 two selmer distribution in full two torsion twist families](../packages/ArithmeticStatistics/README.md#two-selmer-distribution-in-full-two-torsion-twist-families); [§5.9 smith selmer rank limit equals corank](../packages/ArithmeticStatistics/README.md#smith-selmer-rank-limit-equals-corank); [§5.9 even congruent twists have corank zero given smith law](../packages/ArithmeticStatistics/README.md#even-congruent-twists-have-corank-zero-given-smith-law); [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups); [§5.10 cassels isogeny selmer ratio formula](../packages/ArithmeticStatistics/README.md#cassels-isogeny-selmer-ratio-formula); [§5.10 isogeny factorisation selmer exact sequence](../packages/ArithmeticStatistics/README.md#isogeny-factorisation-selmer-exact-sequence); [§5.10 three isogeny selmer parity](../packages/ArithmeticStatistics/README.md#three-isogeny-selmer-parity); [§5.10 reduced p selmer rank bounds the corank](../packages/ArithmeticStatistics/README.md#reduced-p-selmer-rank-bounds-the-corank); [§5.11 cm twists have corank zero at least half](../packages/ArithmeticStatistics/README.md#cm-twists-have-corank-zero-at-least-half); [§5.9 function field 3 selmer average bound](../packages/ArithmeticStatistics/README.md#function-field-3-selmer-average-bound) |

| core / 35 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors` | TauCetiRoadmap.ClassFieldTheory Layer 7 | [§5.11 cm curves have a twist with good reduction](../packages/ArithmeticStatistics/README.md#cm-curves-have-a-twist-with-good-reduction) |

| core / 36 | `GeometryOfNumbersAndQuadraticArithmetic:GN.0` | GeometryOfNumbersAndQuadraticArithmetic:GN.0 | [§5.12 two point incidence count](../packages/ArithmeticStatistics/README.md#two-point-incidence-count) |

| core / 37 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | GeometryOfNumbersAndQuadraticArithmetic:GN.2 | [§5.13 model ring orbit count concentration](../packages/ArithmeticStatistics/README.md#model-ring-orbit-count-concentration); [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor) |

| core / 38 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | GeometryOfNumbersAndQuadraticArithmetic:GN.3 | [§5.13 model ring orbit count concentration](../packages/ArithmeticStatistics/README.md#model-ring-orbit-count-concentration); [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor) |

| core / 39 | `AbelianSchemesAndArithmeticModuli:A2` | AbelianSchemesAndArithmeticModuli:A2 | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor) |

| core / 40 | `AbelianSchemesAndArithmeticModuli:A6` | AbelianSchemesAndArithmeticModuli:A6 | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor) |

| core / 41 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1` | TauCetiRoadmap.EllipticCurves Layer 3 | [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 42 | `InverseGaloisAndArithmeticFundamentalGroups:IG.5` | InverseGaloisAndArithmeticFundamentalGroups:IG.5 | [§5.15 hurwitz points classify class group surjections](../packages/ArithmeticStatistics/README.md#hurwitz-points-classify-class-group-surjections); [§5.17 geometric generic fibre of the unmarked hurwitz cover](../packages/ArithmeticStatistics/README.md#geometric-generic-fibre-of-the-unmarked-hurwitz-cover); [§5.19 uniform function field surjection moment estimate](../packages/ArithmeticStatistics/README.md#uniform-function-field-surjection-moment-estimate); [§5.20 imaginary per component unit moment](../packages/ArithmeticStatistics/README.md#imaginary-per-component-unit-moment); [§5.20 real per component unit moment](../packages/ArithmeticStatistics/README.md#real-per-component-unit-moment); [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment); [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 whole fixed degree component profile](../packages/ArithmeticStatistics/README.md#whole-fixed-degree-component-profile); [§5.21 complete stable range component sum](../packages/ArithmeticStatistics/README.md#complete-stable-range-component-sum); [§5.21 moment minus component profile vanishes](../packages/ArithmeticStatistics/README.md#moment-minus-component-profile-vanishes); [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) |

| core / 43 | `InverseGaloisAndArithmeticFundamentalGroups:IG.0` | InverseGaloisAndArithmeticFundamentalGroups:IG.0 | [§5.18 monodromy orbits and rational components](../packages/ArithmeticStatistics/README.md#monodromy-orbits-and-rational-components); [§5.17 mod l hyperelliptic monodromy is symplectic](../packages/ArithmeticStatistics/README.md#mod-l-hyperelliptic-monodromy-is-symplectic); [§5.17 monodromy of the odd degree polynomial family](../packages/ArithmeticStatistics/README.md#monodromy-of-the-odd-degree-polynomial-family) |

| core / 44 | `InverseGaloisAndArithmeticFundamentalGroups:IG.1` | InverseGaloisAndArithmeticFundamentalGroups:IG.1 | [§5.18 monodromy orbits and rational components](../packages/ArithmeticStatistics/README.md#monodromy-orbits-and-rational-components); [§5.17 monodromy of the odd degree polynomial family](../packages/ArithmeticStatistics/README.md#monodromy-of-the-odd-degree-polynomial-family); [§5.17 hyperelliptic boundary degeneration](../packages/ArithmeticStatistics/README.md#hyperelliptic-boundary-degeneration) |

| core / 45 | `InverseGaloisAndArithmeticFundamentalGroups:IG.4` | InverseGaloisAndArithmeticFundamentalGroups:IG.4 | [§5.20 imaginary per component unit moment](../packages/ArithmeticStatistics/README.md#imaginary-per-component-unit-moment); [§5.20 real per component unit moment](../packages/ArithmeticStatistics/README.md#real-per-component-unit-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 moment minus component profile vanishes](../packages/ArithmeticStatistics/README.md#moment-minus-component-profile-vanishes); [§5.22 counting unramified h extensions via semidirect extensions](../packages/ArithmeticStatistics/README.md#counting-unramified-h-extensions-via-semidirect-extensions) |

| core / 46 | `FunctionFieldArithmetic:FA.4` | [function-field class-field and Picard comparison](#support-function-fields) | [§5.15 involution quotient of the unramified pro l group](../packages/ArithmeticStatistics/README.md#involution-quotient-of-the-unramified-pro-l-group); [§5.15 hurwitz points classify class group surjections](../packages/ArithmeticStatistics/README.md#hurwitz-points-classify-class-group-surjections); [§5.17 geometric generic fibre of the unmarked hurwitz cover](../packages/ArithmeticStatistics/README.md#geometric-generic-fibre-of-the-unmarked-hurwitz-cover); [§5.22 cohen lenstra martinet moments over function fields](../packages/ArithmeticStatistics/README.md#cohen-lenstra-martinet-moments-over-function-fields) |

| core / 47 | `SchemeAndStackFoundations:SF.2` | SchemeAndStackFoundations:SF.2 | [§5.16 top cohomology counts rational components](../packages/ArithmeticStatistics/README.md#top-cohomology-counts-rational-components); [§5.16 uniform trace error estimate](../packages/ArithmeticStatistics/README.md#uniform-trace-error-estimate); [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) |

| core / 48 | `EtaleDualityAndPerverseSheaves:EDC.2` | EtaleDualityAndPerverseSheaves:EDC.2 | [§5.16 top cohomology counts rational components](../packages/ArithmeticStatistics/README.md#top-cohomology-counts-rational-components); [§5.16 uniform trace error estimate](../packages/ArithmeticStatistics/README.md#uniform-trace-error-estimate) |

| core / 49 | `DeligneWeightsAndPurity:DWP.7` | DeligneWeightsAndPurity:DWP.7 | [§5.16 uniform trace error estimate](../packages/ArithmeticStatistics/README.md#uniform-trace-error-estimate); [§5.22 liu wood zureick brown function field moments](../packages/ArithmeticStatistics/README.md#liu-wood-zureick-brown-function-field-moments) |

| core / 50 | `AbelianSchemesAndArithmeticModuli:A3` | AbelianSchemesAndArithmeticModuli:A3 | [§5.17 hyperelliptic torsion local system](../packages/ArithmeticStatistics/README.md#hyperelliptic-torsion-local-system) |

| core / 51 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` | TauCetiRoadmap.JacobianChallenge Layer d | [§5.17 hyperelliptic torsion local system](../packages/ArithmeticStatistics/README.md#hyperelliptic-torsion-local-system); [§5.17 hyperelliptic boundary degeneration](../packages/ArithmeticStatistics/README.md#hyperelliptic-boundary-degeneration) |

| core / 52 | `GeometryOfNumbersAndQuadraticArithmetic:GN.0` | GeometryOfNumbersAndQuadraticArithmetic:GN.0 | [§0.10 coefficient vector form](../packages/ArithmeticStatistics/README.md#coefficient-vector-form); [§5.12 veronese minor valuation](../packages/ArithmeticStatistics/README.md#veronese-minor-valuation) |

| core / 53 | `SchemeAndStackFoundations:SF.0` | SchemeAndStackFoundations:SF.0 | [§2.1 lattice points on a subvariety in a dilated region](../packages/ArithmeticStatistics/README.md#lattice-points-on-a-subvariety-in-a-dilated-region); [§2.1 uniform bound for points of a subscheme modulo p](../packages/ArithmeticStatistics/README.md#uniform-bound-for-points-of-a-subscheme-modulo-p); [§2.1 geometric sieve large primes](../packages/ArithmeticStatistics/README.md#geometric-sieve-large-primes); [§2.1 strong divisibility lies on a codimension two locus](../packages/ArithmeticStatistics/README.md#strong-divisibility-lies-on-a-codimension-two-locus) |

| core / 54 | `AbelianSchemesAndArithmeticModuliPartII:F0` | [finite-field abelian counting inputs](#support-abelian-counts) | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 55 | `AbelianSchemesAndArithmeticModuliPartII:F3` | [finite-field abelian counting inputs](#support-abelian-counts) | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 56 | `AbelianSchemesAndArithmeticModuliPartII:F5` | [finite-field abelian counting inputs](#support-abelian-counts) | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 57 | `AbelianSchemesAndArithmeticModuliPartII:F6` | [finite-field abelian counting inputs](#support-abelian-counts) | [§5.13 most ppavs have a large elliptic or real weil factor](../packages/ArithmeticStatistics/README.md#most-ppavs-have-a-large-elliptic-or-real-weil-factor); [§5.14 spacing measure discrepancy for ppavs](../packages/ArithmeticStatistics/README.md#spacing-measure-discrepancy-for-ppavs); [§5.14 enhanced cohen lenstra fails for ppavs](../packages/ArithmeticStatistics/README.md#enhanced-cohen-lenstra-fails-for-ppavs) |

| core / 58 | `InductionRestrictionPartII:RS.4` | [embedded types and signature representations](#support-embedded-types) | [§5.20 imaginary normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#imaginary-normalized-nonabelian-moment); [§5.20 real normalized nonabelian moment](../packages/ArithmeticStatistics/README.md#real-normalized-nonabelian-moment); [§5.21 bad type lower bound](../packages/ArithmeticStatistics/README.md#bad-type-lower-bound); [§5.21 complete stable range component sum](../packages/ArithmeticStatistics/README.md#complete-stable-range-component-sum) |

| ST.0 / 0 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§0.14 odd root criterion](../packages/ArithmeticStatistics/README.md#odd-root-criterion); [§1.9 binary density formulas](../packages/ArithmeticStatistics/README.md#binary-density-formulas); [§0.23 stickelberger binary](../packages/ArithmeticStatistics/README.md#stickelberger-binary); [§0.12 local maximality](../packages/ArithmeticStatistics/README.md#local-maximality) |

| ST.0 / 1 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§0.24 monic euler products](../packages/ArithmeticStatistics/README.md#monic-euler-products); [§0.1 stabilizer weighted orbit count](../packages/ArithmeticStatistics/README.md#stabilizer-weighted-orbit-count) |

| ST.0 / 2 | `AnalyticNumberTheory:AN.4` | AnalyticNumberTheory:AN.4 | [§0.15 positive squareclass denominator](../packages/ArithmeticStatistics/README.md#twist-denominator-frontier) |

| ST.0 / 3 | `AbelianSchemesAndArithmeticModuliPartII:F3` | [finite-field abelian counting inputs](#support-abelian-counts) | [§0.16 unpolarized abelian count](../packages/ArithmeticStatistics/README.md#unpolarized-abelian-count) |

| ST.0 / 4 | `AbelianSchemesAndArithmeticModuli:A2` | AbelianSchemesAndArithmeticModuli:A2 | [§0.16 principally polarized count](../packages/ArithmeticStatistics/README.md#principally-polarized-count); [§0.16 polarization fiber count](../packages/ArithmeticStatistics/README.md#polarization-fiber-count) |

| ST.0 / 5 | `PELModuli:M6` | AbelianSchemesAndArithmeticModuli:A6 (Rosati polarization orbits) | [§0.16 principally polarized count](../packages/ArithmeticStatistics/README.md#principally-polarized-count) |

| ST.0 / 6 | `AbelianSchemesAndArithmeticModuliPartII:F5` | [finite-field abelian counting inputs](#support-abelian-counts) | [§0.16 polarization fiber count](../packages/ArithmeticStatistics/README.md#polarization-fiber-count) |

| ST.0 / 7 | `tauceti:TauCetiRoadmap/PolynomialGaloisGroups#layer-2-the-dictionary-between-galois-theory-and-permutations` | TauCetiRoadmap.PolynomialGaloisGroups Layer 2 | Scope: TauCetiRoadmap.PolynomialGaloisGroups Layers 0, 2 and 6 (the native permutation-action predicate) |

| ST.0 / 8 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` | TauCetiRoadmap.JacobianChallenge Layer d | [§0.18 finite picard quotient](../packages/ArithmeticStatistics/README.md#finite-picard-quotient) |

| ST.0 / 9 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality` | TauCetiRoadmap.JacobianChallenge Layer b | [§0.17 natural bundle law](../packages/ArithmeticStatistics/README.md#natural-bundle-law); [§0.18 theta tail normalization](../packages/ArithmeticStatistics/README.md#theta-tail-normalization); [§0.18 finite joint bundle mass](../packages/ArithmeticStatistics/README.md#finite-joint-bundle-mass); [§0.18 pointless curve regression](../packages/ArithmeticStatistics/README.md#pointless-curve-regression) |

| ST.0 / 10 | `AdelicAlgebraicGroups:AA.2` | AdelicAlgebraicGroups:AA.2 | [§0.18 hecke pushforward](../packages/ArithmeticStatistics/README.md#hecke-pushforward) |

| ST.0 / 11 | `InverseGaloisAndArithmeticFundamentalGroups:IG.4` | InverseGaloisAndArithmeticFundamentalGroups:IG.4 | [§0.19 wood infinity and type adapter](../packages/ArithmeticStatistics/README.md#wood-infinity-and-type-adapter); [§0.21 wood average normalizations](../packages/ArithmeticStatistics/README.md#wood-average-normalizations) |

| ST.1 / 0 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` | TauCetiRoadmap.JacobianChallenge Layer d | [§1.12 pencil fano torsor](../packages/ArithmeticStatistics/README.md#refinement-pencil-fano-torsor); [§1.12 pencil existence](../packages/ArithmeticStatistics/README.md#refinement-pencil-existence); [§1.12 locally soluble pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-locally-soluble-pencil-orbits); [§1.14 genus one stabilizer schemes](../packages/ArithmeticStatistics/README.md#refinement-genus-one-stabilizer-schemes) |

| ST.1 / 1 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree` | TauCetiRoadmap.JacobianChallenge Layer a | [§1.14 genus one stabilizer schemes](../packages/ArithmeticStatistics/README.md#refinement-genus-one-stabilizer-schemes); [§1.12 pencil fano torsor](../packages/ArithmeticStatistics/README.md#refinement-pencil-fano-torsor) |

| ST.1 / 2 | `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4` | TauCetiRoadmap.EllipticCurves Layer 7 | [§1.12 locally soluble pencil orbits](../packages/ArithmeticStatistics/README.md#refinement-locally-soluble-pencil-orbits); [§1.14 genus one stabilizer schemes](../packages/ArithmeticStatistics/README.md#refinement-genus-one-stabilizer-schemes) |

| ST.1 / 3 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | GeometryOfNumbersAndQuadraticArithmetic:GN.2 | [§1.11 wood ring interpretation](../packages/ArithmeticStatistics/README.md#refinement-wood-ring-interpretation) |

| ST.2 / 0 | `SieveMethodsAndPrimePatterns:SV.2` | [coefficient sieves](#support-sieves) and [quadratic character-sum bounds](#support-character-sums) | [§2.13 monic distinguished off block](../packages/ArithmeticStatistics/README.md#refinement-monic-distinguished-off-block); [§2.13 monic extra reducible bound](../packages/ArithmeticStatistics/README.md#refinement-monic-extra-reducible-bound); [§2.16 binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-binary-summed-tail) |

| ST.2 / 1 | `AnalyticNumberTheory:AN.5` | AnalyticNumberTheory:AN.5 | [§2.13 monic rational root bound](../packages/ArithmeticStatistics/README.md#refinement-monic-rational-root-bound); [§2.8 quartic fixed reducible resolvent](../packages/ArithmeticStatistics/README.md#refinement-quartic-fixed-reducible-resolvent); [§2.13 monic summed tail](../packages/ArithmeticStatistics/README.md#refinement-monic-summed-tail); [§2.16 quadratic binary summed tail](../packages/ArithmeticStatistics/README.md#refinement-quadratic-binary-summed-tail); [§2.23 hypersurface finite local count](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-finite-local-count); [§2.11 cubic secondary sieve error](../packages/ArithmeticStatistics/README.md#refinement-cubic-secondary-sieve-error) |

| ST.2 / 2 | `SchemeAndStackFoundations:SF.0` | SchemeAndStackFoundations:SF.0 | [§2.13 monic strong tail](../packages/ArithmeticStatistics/README.md#refinement-monic-strong-tail); [§2.10 global field large prime tail](../packages/ArithmeticStatistics/README.md#refinement-global-field-large-prime-tail); [§2.16 even binary restricted gram](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-gram); [§2.23 hypersurface local tail](../packages/ArithmeticStatistics/README.md#refinement-hypersurface-local-tail) |

| ST.2 / 3 | `GeometryOfNumbersAndQuadraticArithmetic:GN.4` | GeometryOfNumbersAndQuadraticArithmetic:GN.4 | [§2.16 even binary main shallow](../packages/ArithmeticStatistics/README.md#refinement-even-binary-main-shallow); [§2.16 even binary restricted deep tail](../packages/ArithmeticStatistics/README.md#refinement-even-binary-restricted-deep-tail) |

| ST.3 / 0 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | TauCetiRoadmap.ClassFieldTheory Layer 13 | [§3.19 cubic conductor discriminant](../packages/ArithmeticStatistics/README.md#cubic-conductor-discriminant); [§3.29 fixed resolvent cubic count](../packages/ArithmeticStatistics/README.md#fixed-resolvent-cubic-count) |

| ST.3 / 1 | `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups` | TauCetiRoadmap.GlobalNumberFields Layer 11 | [§3.19 quadratic order three torsion bound](../packages/ArithmeticStatistics/README.md#quadratic-order-three-torsion-bound) |

| ST.3 / 2 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§3.20 secondary cubic lattice coefficient](../packages/ArithmeticStatistics/README.md#secondary-cubic-lattice-coefficient); [§3.20 refined cubic sieve](../packages/ArithmeticStatistics/README.md#refined-cubic-sieve) |

| ST.3 / 3 | `AdelicAlgebraicGroups:AA.0` | AdelicAlgebraicGroups:AA.0 | [§3.21 low degree s integral parametrization](../packages/ArithmeticStatistics/README.md#low-degree-s-integral-parametrization) |

| ST.3 / 4 | `AdelicAlgebraicGroups:AA.2` | AdelicAlgebraicGroups:AA.2 | [§3.21 low degree jacobian mass](../packages/ArithmeticStatistics/README.md#low-degree-jacobian-mass) |

| ST.3 / 5 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§3.21 low degree maximal sieve](../packages/ArithmeticStatistics/README.md#low-degree-maximal-sieve) |

| ST.3 / 6 | `SieveMethodsAndPrimePatterns:SV.2` | [coefficient sieves](#support-sieves) and [quadratic character-sum bounds](#support-character-sums) | [§3.22 fk maximal unlinked support](../packages/ArithmeticStatistics/README.md#fk-maximal-unlinked-support) |

| ST.3 / 7 | `AnalyticNumberTheory:AN.2` | AnalyticNumberTheory:AN.2 | [§3.22 fk maximal unlinked support](../packages/ArithmeticStatistics/README.md#fk-maximal-unlinked-support) |

| ST.3 / 8 | `AnalyticNumberTheory:AN.5` | AnalyticNumberTheory:AN.5 | [§3.22 fk maximal unlinked support](../packages/ArithmeticStatistics/README.md#fk-maximal-unlinked-support) |

| ST.3 / 9 | `SieveMethodsAndPrimePatterns:SV.1` | [squarefree denominators](#support-squareclasses) | [§3.22 fk narrow wide moment comparison](../packages/ArithmeticStatistics/README.md#fk-narrow-wide-moment-comparison) |

| ST.3 / 10 | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets` | `Completed/EffectiveBounds Layer 1` (Tau Ceti) | [§3.25 uniform small degree field bound](../packages/ArithmeticStatistics/README.md#uniform-small-degree-field-bound); [§3.25 relative three torsion piecewise bound](../packages/ArithmeticStatistics/README.md#relative-three-torsion-piecewise-bound); [§3.25 quadratic tower torsion tail](../packages/ArithmeticStatistics/README.md#quadratic-tower-torsion-tail); [§3.26 thin two group torsion](../packages/ArithmeticStatistics/README.md#thin-two-group-torsion); [§3.26 relative wreath three torsion mean](../packages/ArithmeticStatistics/README.md#relative-wreath-three-torsion-mean) |

| ST.3 / 11 | `tauceti:Completed/EffectiveBounds#layer-3-regulators-and-unit-lattice-volume` | `Completed/EffectiveBounds Layer 3` (Tau Ceti) | [§3.25 relative three torsion piecewise bound](../packages/ArithmeticStatistics/README.md#relative-three-torsion-piecewise-bound) |

| ST.3 / 12 | `AnalyticNumberTheory:AN.8` | AnalyticNumberTheory:AN.8 | [§3.25 shintani cubic order uniform bound](../packages/ArithmeticStatistics/README.md#shintani-cubic-order-uniform-bound) |

| ST.3 / 13 | `AnalyticNumberTheory:AN.4` | AnalyticNumberTheory:AN.4 | [§3.25 uniform small degree field bound](../packages/ArithmeticStatistics/README.md#uniform-small-degree-field-bound); [§3.25 relative three torsion propagation](../packages/ArithmeticStatistics/README.md#relative-three-torsion-propagation); [§3.25 relative three torsion piecewise bound](../packages/ArithmeticStatistics/README.md#relative-three-torsion-piecewise-bound) |

| ST.3 / 14 | `AnalyticNumberTheory:AN.3` | AnalyticNumberTheory:AN.3 | [§3.25 quadratic tower torsion tail](../packages/ArithmeticStatistics/README.md#quadratic-tower-torsion-tail); [§3.26 thin two group torsion](../packages/ArithmeticStatistics/README.md#thin-two-group-torsion) |

| ST.3 / 15 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | TauCetiRoadmap.ClassFieldTheory Layer 13 | [§3.27 nonabelian quadratic moment interface](../packages/ArithmeticStatistics/README.md#nonabelian-quadratic-moment-interface); [§3.27 nonabelian admissibility and abelianization](../packages/ArithmeticStatistics/README.md#nonabelian-admissibility-and-abelianization); [§3.27 a4 appendix kernel enumerator](../packages/ArithmeticStatistics/README.md#a4-appendix-kernel-enumerator); [§3.27 elementary two moment euler products](../packages/ArithmeticStatistics/README.md#elementary-two-moment-euler-products) |

| ST.3 / 16 | `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara` | TauCetiRoadmap.ArithmeticDirichletSeries Layer 9 | [§3.27 elementary two moment divergence](../packages/ArithmeticStatistics/README.md#elementary-two-moment-divergence); [§3.29 fixed resolvent cubic count](../packages/ArithmeticStatistics/README.md#fixed-resolvent-cubic-count) |

| ST.3 / 17 | `tauceti:Completed/EffectiveBounds#layer-1-effective-upper-bounds-the-first-migration-targets` | `Completed/EffectiveBounds Layer 1` (Tau Ceti) | [§3.28 small trace zero element](../packages/ArithmeticStatistics/README.md#small-trace-zero-element); [§3.28 schmidt field count bound](../packages/ArithmeticStatistics/README.md#schmidt-field-count-bound); [§3.28 lemke oliver thorne field bound](../packages/ArithmeticStatistics/README.md#lemke-oliver-thorne-field-bound); [§3.29 galois field three eighths bound](../packages/ArithmeticStatistics/README.md#galois-field-three-eighths-bound); [§3.29 quartic torsion counting applications](../packages/ArithmeticStatistics/README.md#quartic-torsion-counting-applications) |

| ST.3 / 18 | `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation` | TauCetiRoadmap.ArithmeticDirichletSeries Layer 6 | [§3.29 weighted cubic partial summation](../packages/ArithmeticStatistics/README.md#weighted-cubic-partial-summation) |

| ST.3 / 19 | `SieveMethodsAndPrimePatterns:SV.5` | [prime character-sum estimates](#support-character-sums) | [§3.30 sixteen rank spin criterion](../packages/ArithmeticStatistics/README.md#sixteen-rank-spin-criterion); [§3.30 no sixteen rank governing field](../packages/ArithmeticStatistics/README.md#no-sixteen-rank-governing-field) |

| ST.3 / 20 | `ExponentialSumsAndCircleMethod:ES.0` | [mixed-trace and character-sum estimates](#support-character-sums) | [§3.30 no sixteen rank governing field](../packages/ArithmeticStatistics/README.md#no-sixteen-rank-governing-field) |

| ST.3 / 21 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§3.32 monic polynomial sieve counts](../packages/ArithmeticStatistics/README.md#monic-polynomial-sieve-counts); [§3.32 trace restricted polynomial sieve](../packages/ArithmeticStatistics/README.md#trace-restricted-polynomial-sieve); [§3.34 binary form sieve counts](../packages/ArithmeticStatistics/README.md#binary-form-sieve-counts); [§3.32 monic weak quasi reduction](../packages/ArithmeticStatistics/README.md#monic-weak-quasi-reduction) |

| ST.3 / 22 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§3.32 polynomial order lattice reduction](../packages/ArithmeticStatistics/README.md#polynomial-order-lattice-reduction); [§3.34 binary discriminant local factors](../packages/ArithmeticStatistics/README.md#binary-discriminant-local-factors); [§3.34 binary form arithmetic bertini](../packages/ArithmeticStatistics/README.md#binary-form-arithmetic-bertini) |

| ST.3 / 23 | `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy` | TauCetiRoadmap.GlobalQuadraticForms Layer 5 | [§3.22 quadratic four rank conic formula](../packages/ArithmeticStatistics/README.md#quadratic-four-rank-conic-formula); [§3.31 restricted real quadratic family](../packages/ArithmeticStatistics/README.md#restricted-real-quadratic-family) |

| ST.3 / 24 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§3.21 low degree s integral parametrization](../packages/ArithmeticStatistics/README.md#low-degree-s-integral-parametrization) |

| ST.3 / 25 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` | TauCetiRoadmap.ClassFieldTheory Layer 13 | [§3.23 relative torsion splitting](../packages/ArithmeticStatistics/README.md#relative-torsion-splitting); [§3.24 quartic class group two torsion fibre](../packages/ArithmeticStatistics/README.md#quartic-class-group-two-torsion-fibre); [§3.24 low degree class group mass ratios](../packages/ArithmeticStatistics/README.md#low-degree-class-group-mass-ratios) |

| ST.3 / 26 | `ArithmeticStatistics:ST.5/moments-determine-cohen-lenstra-limits-for-all-p-and-u` | [§3.13 moments determine cohen lenstra limits for all p and u](../packages/ArithmeticStatistics/README.md#moments-determine-cohen-lenstra-limits-for-all-p-and-u) | [§3.22 rank moments determine rank law](../packages/ArithmeticStatistics/README.md#rank-moments-determine-rank-law) |

| ST.4 / 0 | `HeightsRationalPointsAndObstructions:RP.1` | HeightsRationalPointsAndObstructions:RP.1 | [§4.16 hyperelliptic local mass ratio](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-local-mass-ratio); [§4.19 hyperelliptic average two](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-average-two); [§4.21 degree one points empty or infinite](../packages/ArithmeticStatistics/README.md#refinement-degree-one-points-empty-or-infinite) |

| ST.4 / 1 | `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants` | TauCetiRoadmap.ClassFieldTheory Layer 10 | [§4.15 degree one arithmetic comparison](../packages/ArithmeticStatistics/README.md#refinement-degree-one-arithmetic-comparison) |

| ST.4 / 2 | `AdelicAlgebraicGroups:AA.2` | AdelicAlgebraicGroups:AA.2 | [§4.16 hyperelliptic local mass ratio](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-local-mass-ratio); [§4.16 pencil measure comparison](../packages/ArithmeticStatistics/README.md#refinement-pencil-measure-comparison); [§4.16 tamagawa central quotient](../packages/ArithmeticStatistics/README.md#refinement-tamagawa-central-quotient) |

| ST.4 / 3 | `AdelicAlgebraicGroups:AA.4` | AdelicAlgebraicGroups:AA.4 | [§4.15 pencil local global weight](../packages/ArithmeticStatistics/README.md#refinement-pencil-local-global-weight) |

| ST.4 / 4 | `InverseGaloisAndArithmeticFundamentalGroups:IG.2` | InverseGaloisAndArithmeticFundamentalGroups:IG.2 | [§4.15 generic weierstrass class](../packages/ArithmeticStatistics/README.md#refinement-generic-weierstrass-class) |

| ST.4 / 5 | `ProbabilisticAndMetricNumberTheory:PM.1` | [fixed-real-root probability estimate](#support-real-roots) | [§4.20 order k vanishing average](../packages/ArithmeticStatistics/README.md#refinement-order-k-vanishing-average) |

| ST.4 / 6 | `SelmerIwasawaCohomology:L1` | SelmerIwasawaCohomology:L1 | [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity); [§4.18 four twist local parity](../packages/ArithmeticStatistics/README.md#refinement-four-twist-local-parity) |

| ST.4 / 7 | `SelmerIwasawaCohomology:L2` | SelmerIwasawaCohomology:L2 | [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity); [§4.18 biquadratic parity formula](../packages/ArithmeticStatistics/README.md#refinement-biquadratic-parity-formula); [§4.21 positive nontrivial sha two](../packages/ArithmeticStatistics/README.md#refinement-positive-nontrivial-sha-two); [§4.22 rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-rank-one-selmer-criterion); [§4.22 twisted rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-twisted-rank-one-selmer-criterion); [§4.22 rank one family properties](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family-properties); [§4.22 local five quotient comparison](../packages/ArithmeticStatistics/README.md#refinement-local-five-quotient-comparison); [§4.23 rank one torsion image bound](../packages/ArithmeticStatistics/README.md#refinement-rank-one-torsion-image-bound); [§4.24 soluble generic three selmer elements](../packages/ArithmeticStatistics/README.md#refinement-soluble-generic-three-selmer-elements) |

| ST.4 / 8 | `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-0-the-functorial-core----transitivity-and-the-projection-formula` | TauCetiRoadmap.RepresentationTheory.InductionRestriction Layer 0 and [Brauer relations and regulator constants](#support-regulator-constants) | [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity); [§4.18 four twist local parity](../packages/ArithmeticStatistics/README.md#refinement-four-twist-local-parity) |

| ST.4 / 9 | `NeronModelsAndSemistableAbelianVarieties:R11.3` | NeronModelsAndSemistableAbelianVarieties:R11.3 | [§4.18 selmer regulator parity](../packages/ArithmeticStatistics/README.md#refinement-selmer-regulator-parity); [§4.18 four twist local parity](../packages/ArithmeticStatistics/README.md#refinement-four-twist-local-parity) |

| ST.4 / 10 | `NeronModelsAndSemistableAbelianVarieties:R11.6` | NeronModelsAndSemistableAbelianVarieties:R11.6 | [§4.22 rank one family properties](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family-properties) |

| ST.4 / 11 | `ArithmeticGaloisRepresentations:R01.6` | ArithmeticGaloisRepresentations:R01.6 | [§4.22 rank one family properties](../packages/ArithmeticStatistics/README.md#refinement-rank-one-family-properties) |

| ST.4 / 12 | `RankZeroOneBSD:BSD.0` | [elliptic modularity and the precise rank-one converse](#support-analytic-rank) | [§4.22 rank one selmer criterion](../packages/ArithmeticStatistics/README.md#refinement-rank-one-selmer-criterion) |

| ST.4 / 13 | `WeilConjectures:WC.5` | DeligneWeightsAndPurity §1.6 (curve point bounds) | [§4.18 odd residue field models](../packages/ArithmeticStatistics/README.md#refinement-odd-residue-field-models) |

| ST.4 / 14 | `ArithmeticStatistics:ST.0` | the family and local-specification interfaces | [§4.20 order k vanishing average](../packages/ArithmeticStatistics/README.md#refinement-order-k-vanishing-average); [§4.20 small odd degree points disappear](../packages/ArithmeticStatistics/README.md#refinement-small-odd-degree-points-disappear); [§4.18 odd residue field models](../packages/ArithmeticStatistics/README.md#refinement-odd-residue-field-models); [§4.18 admissible family selmer parities](../packages/ArithmeticStatistics/README.md#refinement-admissible-family-selmer-parities); [§4.24 plane cubic height and orbit transfer](../packages/ArithmeticStatistics/README.md#refinement-plane-cubic-height-and-orbit-transfer) |

| ST.4 / 15 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§4.22 local five quotient comparison](../packages/ArithmeticStatistics/README.md#refinement-local-five-quotient-comparison); [§4.24 soluble generic three selmer elements](../packages/ArithmeticStatistics/README.md#refinement-soluble-generic-three-selmer-elements); [§4.24 plane cubic height and orbit transfer](../packages/ArithmeticStatistics/README.md#refinement-plane-cubic-height-and-orbit-transfer); [§4.17 restricted selmer set](../packages/ArithmeticStatistics/README.md#refinement-restricted-selmer-set); [§4.17 real effective divisor image](../packages/ArithmeticStatistics/README.md#refinement-real-effective-divisor-image) |

| ST.4 / 16 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§4.19 hyperelliptic average two](../packages/ArithmeticStatistics/README.md#refinement-hyperelliptic-average-two); [§4.18 admissible family selmer parities](../packages/ArithmeticStatistics/README.md#refinement-admissible-family-selmer-parities); [§4.24 soluble ternary fundamental count](../packages/ArithmeticStatistics/README.md#refinement-soluble-ternary-fundamental-count); [§4.24 positive plane cubic solubility](../packages/ArithmeticStatistics/README.md#refinement-positive-plane-cubic-solubility) |

| ST.4 / 17 | `ArithmeticStatistics:ST.5` | the probabilistic model interfaces | [§4.22 five selmer local equidistribution](../packages/ArithmeticStatistics/README.md#refinement-five-selmer-local-equidistribution) |

| ST.4 / 18 | `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme` | TauCetiRoadmap.JacobianChallenge Layer d | [§4.17 restricted selmer set](../packages/ArithmeticStatistics/README.md#refinement-restricted-selmer-set); [§4.17 real effective divisor image](../packages/ArithmeticStatistics/README.md#refinement-real-effective-divisor-image) |

| ST.5 / 0 | `SelmerIwasawaCohomology:L0` | SelmerIwasawaCohomology:L0 | [§5.27 sha one vanishing](../packages/ArithmeticStatistics/README.md#refinement-sha-one-vanishing); [§5.31 kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-kummer-direct-summand); [§5.31 adelic kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-adelic-kummer-direct-summand); [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture); [§5.31 trivial action global splitting](../packages/ArithmeticStatistics/README.md#refinement-trivial-action-global-splitting); [§4.26 two selmer nonlift](../packages/ArithmeticStatistics/README.md#refinement-two-selmer-nonlift); [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound) |

| ST.5 / 1 | `SelmerIwasawaCohomology:L1` | SelmerIwasawaCohomology:L1 | [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection); [§4.25 balanced three rank one](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-one); [§5.10 three isogeny selmer parity](../packages/ArithmeticStatistics/README.md#three-isogeny-selmer-parity) |

| ST.5 / 2 | `SelmerIwasawaCohomology:L2` | SelmerIwasawaCohomology:L2 | [§4.25 balanced three rank zero](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-zero); [§4.25 balanced three rank one](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-one); [§4.27 five balanced bounds](../packages/ArithmeticStatistics/README.md#refinement-five-balanced-bounds) |

| ST.5 / 3 | `SelmerIwasawaCohomology:L3` | SelmerIwasawaCohomology:L3 | [§4.25 analytic rank zero criterion](../packages/ArithmeticStatistics/README.md#refinement-analytic-rank-zero-criterion) |

| ST.5 / 4 | `ArithmeticGaloisDuality:D7` | ArithmeticGaloisDuality:D7 | [§5.27 sha one vanishing](../packages/ArithmeticStatistics/README.md#refinement-sha-one-vanishing); [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection); [§5.26 lc finite reductions](../packages/ArithmeticStatistics/README.md#refinement-lc-finite-reductions); [§5.26 lc restricted product](../packages/ArithmeticStatistics/README.md#refinement-lc-restricted-product); [§5.31 trivial action global splitting](../packages/ArithmeticStatistics/README.md#refinement-trivial-action-global-splitting) |

| ST.5 / 5 | `AbelianSchemesAndArithmeticModuli:A3` | AbelianSchemesAndArithmeticModuli:A3 | [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection) |

| ST.5 / 6 | `AbelianSchemesAndArithmeticModuli:A3` | AbelianSchemesAndArithmeticModuli:A3 | [§5.27 selmer quadratic intersection](../packages/ArithmeticStatistics/README.md#refinement-selmer-quadratic-intersection); [§5.31 kummer direct summand](../packages/ArithmeticStatistics/README.md#refinement-kummer-direct-summand); [§5.31 trivial action global splitting](../packages/ArithmeticStatistics/README.md#refinement-trivial-action-global-splitting); [§4.25 analytic rank zero criterion](../packages/ArithmeticStatistics/README.md#refinement-analytic-rank-zero-criterion); [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.32 multiplication three rank bound](../packages/ArithmeticStatistics/README.md#refinement-multiplication-three-rank-bound); [§5.32 finite extension rank bound](../packages/ArithmeticStatistics/README.md#refinement-finite-extension-rank-bound) |

| ST.5 / 7 | `AbelianSchemesAndArithmeticModuli:A6` | AbelianSchemesAndArithmeticModuli:A6 | [§5.32 endomorphism rank bound](../packages/ArithmeticStatistics/README.md#refinement-endomorphism-rank-bound) |

| ST.5 / 8 | `AlgebraicModuliForArithmeticGeometry:R09.1` | AlgebraicModuliForArithmeticGeometry:R09.1 | [§5.29 smooth cylinder measure](../packages/ArithmeticStatistics/README.md#refinement-smooth-cylinder-measure); [§5.29 ogr smooth projective](../packages/ArithmeticStatistics/README.md#refinement-ogr-smooth-projective); [§5.29 ogr components](../packages/ArithmeticStatistics/README.md#refinement-ogr-components); [§5.29 ogr schubert dimension](../packages/ArithmeticStatistics/README.md#refinement-ogr-schubert-dimension) |

| ST.5 / 9 | `AdelicAlgebraicGroups:AA.2` | AdelicAlgebraicGroups:AA.2 | [§5.29 smooth cylinder measure](../packages/ArithmeticStatistics/README.md#refinement-smooth-cylinder-measure); [§5.29 ogr schubert dimension](../packages/ArithmeticStatistics/README.md#refinement-ogr-schubert-dimension) |

| ST.5 / 10 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group) |

| ST.5 / 11 | `ArithmeticStatistics:ST.4` | the Selmer average interfaces | [§4.14 average size of the 3 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-3-selmer-group); [§4.14 average size of the 4 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-4-selmer-group); [§4.14 average size of the 5 selmer group](../packages/ArithmeticStatistics/README.md#average-size-of-the-5-selmer-group); [§4.25 balanced three rank zero](../packages/ArithmeticStatistics/README.md#refinement-balanced-three-rank-zero); [§4.27 five basic bounds](../packages/ArithmeticStatistics/README.md#refinement-five-basic-bounds) |

| ST.5 / 12 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group); [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average) |

| ST.5 / 13 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§4.14 second moment of the 2 selmer group](../packages/ArithmeticStatistics/README.md#second-moment-of-the-2-selmer-group); [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average) |

| ST.5 / 14 | `ArithmeticStatistics:ST.1` | the integral orbit dictionary interfaces | [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.10 bklos average size of three isogeny selmer groups](../packages/ArithmeticStatistics/README.md#bklos-average-size-of-three-isogeny-selmer-groups) |

| ST.5 / 15 | `ArithmeticStatistics:ST.2` | the uniform counting interfaces | [§5.32 abelian three isogeny average](../packages/ArithmeticStatistics/README.md#refinement-abelian-three-isogeny-average); [§5.32 elliptic explicit twist rank](../packages/ArithmeticStatistics/README.md#refinement-elliptic-explicit-twist-rank); [§5.32 signature positive twists](../packages/ArithmeticStatistics/README.md#refinement-signature-positive-twists) |

| ST.5 / 16 | `ArithmeticStatistics:ST.4` | the Selmer average interfaces | [§5.10 tamagawa ratio under potentially good reduction](../packages/ArithmeticStatistics/README.md#tamagawa-ratio-under-potentially-good-reduction); [§5.11 cm three isogeny has selmer ratio one](../packages/ArithmeticStatistics/README.md#cm-three-isogeny-has-selmer-ratio-one); [§5.32 signature positive twists](../packages/ArithmeticStatistics/README.md#refinement-signature-positive-twists); [§5.32 complex place obstruction](../packages/ArithmeticStatistics/README.md#refinement-complex-place-obstruction) |

| ST.5 / 17 | `ArithmeticStatistics:ST.0` | the family and local-specification interfaces | [§4.25 positive three ranks](../packages/ArithmeticStatistics/README.md#refinement-positive-three-ranks); [§4.27 five root balanced family](../packages/ArithmeticStatistics/README.md#refinement-five-root-balanced-family); [§4.28 jacobian marked average](../packages/ArithmeticStatistics/README.md#refinement-jacobian-marked-average); [§0.20 imaginary exact slice parametrization](../packages/ArithmeticStatistics/README.md#imaginary-exact-slice-parametrization); [§0.20 real exact slice parametrization](../packages/ArithmeticStatistics/README.md#real-exact-slice-parametrization); [§5.28 squarefree selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-squarefree-selmer-conjecture); [§5.28 odd degree jacobian conjecture](../packages/ArithmeticStatistics/README.md#refinement-odd-degree-jacobian-conjecture); [§5.28 even genus two selmer conjecture](../packages/ArithmeticStatistics/README.md#refinement-even-genus-two-selmer-conjecture); [§5.31 global image splitting conjecture](../packages/ArithmeticStatistics/README.md#refinement-global-image-splitting-conjecture) |

## Validation and next action

- `lean-check` on the package Suggested.lean exited 0 at TauCeti `f790474821cf4256814db967cb154e7af3d0c369`, Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Available memory before the check was 96 GB. Its 67 warnings were exclusively “declaration uses sorry”; no language server, Lake build/update/cache acquisition, or private Lean project was used.
- `python3 scripts/check_blueprint.py` on the core and all six accepted refinements exited 0, each with 0 errors and 0 warnings. Inputs were unchanged.
- Exhaustive coverage: all 711 input IDs accounted for; 709 individual target anchors, one merge, one current-upstream deferral; no duplicate anchors or broken fragment links; the local prerequisite order is acyclic and nondecreasing in final layer.
- Every definition/construction retains its API and at least three tests. Full statement/hypothesis/API/acceptance conservation was checked through the inventory; process-only annotations were removed from roadmap prose.
- The independent finite checks described in the mathematical table passed. All kept Lean signatures were compared to their prose carrier, characteristic, nonzero-denominator and dimension conventions.
- `python3 research/blueprint/intake.py check-files` on the four deliverables and `git diff --cached --check` exited 0; the file intake reported 4 files and 0 problems.

No second issue was claimed. The next programme action is independent package review, with particular attention to the original analytic/counting proof obligations and the explicitly conditional even-binary/coregular estimates. This handoff preserves all routing and source-copy receipts needed after temporary scratch removal.
