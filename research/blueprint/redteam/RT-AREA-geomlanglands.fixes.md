# RT-AREA-geomlanglands: verified fixes and integration instructions

Codex, session `codex-rtOQ9t`, 2026-09-29. Job
`FIX-RT-AREA-geomlanglands`, issue #3981.
Inspected snapshot: `8ae020f694107b5f6d3080aeccb63cedfa6df258`.

## Submission boundary

This is a **report-only draft**, with all 31 confirmed findings enumerated
by the issue covered below. No target-file fix is claimed as applied.
The queue lists only this report; `intake.py:own_files` allows it and the
handoff, while `auto_refusals` rejects additional paths. The issue also
asks for changes to target documents and packets. The maintainer must
resolve that output mismatch or apply these edits before treating the
findings as fixed. Existence of this report is not mathematical completion.

Use the **verifier's corrected fix**, not every alternative in the original
finding. In particular: /3 was rejected because accepted paper routes
already own the invariant theory; /6 has contradictory proposed owners,
of which the verifier selects ES2/ES3; /16 already has an integral-group
supplier; /24 already has a Part II owner; /27 does not authorize moving
all derived QCoh/Perf; /30 keeps generic solid theory early.

Campaign targets are `content/campaign/<roadmap>/README.md`. The four
integrated targets are `data/decompositions/GeometricSatakeAndFusion.json`,
`HeckeStacksAndLocalShtukas.json`, `LanglandsParameterStacks.json` and
`VStackSheavesAndLisseCategories.json`. Their reviewed decompositions remain
partial. Corresponding packets, including the split GS0/GS3 and ES0/ES5/ES7
packets, are working inputs, not interchangeable copies of the integrated
files. In particular LP's packet has 33 nodes versus 16 integrated nodes;
apply a fix to the relevant current node without discarding its additions.

All arrows below mean supplier → consumer. Edit the authoritative stage
requirements and source routes, then regenerate atlas/extracts. Do not
patch `research/blueprint/atlas/roadmaps/*.json` as an independent source.
Retain existing proof gaps until their actual inputs have been decomposed.

## Sources and evidence

Read the findings and verification, relevant campaign sections and node
statements, the reviewed coverage entries, and the accepted route records
discussed below. No fresh exhaustive library search or new pinned library
declaration certification is claimed. The baseline remains Mathlib
`082e2d3` and Tau Ceti `f790474`; implementation must read the statements
at those pins before adding declaration-level imports. Existing condensed
modules, root data and representation carriers are not new constructions.

Fresh public-source passage reads on 2026-09-29:

| Source | Inspected passages | PDF SHA-256 |
| --- | --- | --- |
| [Fargues–Scholze v4](https://arxiv.org/pdf/2102.13459v4) | pp. 225–226 (VI.8 and start of VI.9), 238 (VI.11.4 and adjoint reduction), 275 (VII.7.7–VII.7.9), 280 (VIII.1.3/1.4), 341 and 348 (X.1.1 and X.3.1) | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| [Scholze–Weinstein, Berkeley, 27 March 2020](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf) | 13.5.7, 16.3.2, 24.1.2 and following rigidification argument, 24.2.5 and 24.3.5; PDF pages 124, 154, 235, 237, 241 | `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc` |
| [Prasad–Yu, On quasi-reductive group schemes](https://arxiv.org/pdf/math/0405381) | Corollary 1.3 and its two alternatives; proof §5.4 inspected as a source lead | `96d18638f804ff780e126aa4462fae155d935dd535589d89c4e7c84a16f45561` |

FS PDF and printed page numbers agree; Berkeley PDF page is printed page
plus ten in these passages. These are passage reads, not full extractions.
Other locators below are inherited from the verified findings/accepted
routes. In particular PY02, Vignéras, Kaletha, Kottwitz, Deligne–Milne,
Keel and the equal-characteristic extension of the Berkeley arguments
remain source-proof work, not independently certified proofs here.

## Satake and the local-shtuka interface

### RT-AREA-geomlanglands/1 — closure before fusion

**Current:** the campaign still titles GS2:Satake-closure “Closure after
fusion” and explicitly uses GS3. The integrated node
`GS2:Satake-closure/convolution-preserves-satake-and-dualizability` and its
GS0 packet copy must be updated together.

**Replace the stage title** with “Convolution closure and dualizability”.
Replace its opening proof route with: “Prove FS VI.8.1(i)–(ii) using ULA
stability, the two-leg convolution Hecke stack and the relative perverse
criterion. Deduce VI.8.1(iii) using Verdier duality. Prove VI.8.2 using
IV.2.24, VI.6.2 and VI.7.12.” Delete the two sentences making this a return
after fusion. Put the two-leg convolution geometry in GS2, even though it
uses a disjoint-leg locus; it is not the later symmetric fusion product.

Delete GS3:fusion → GS2:Satake-closure; add the reverse edge. GS3's Inputs
must include GS2:Satake-closure and import its monoidal Satake category
and duals. Replace the two old-order acceptance items in the node and
close only the cycle gap after the changes actually pass validation.

**Tests:** convolution of two flat perverse ULA objects; right dual
`sw* D(A)`; collision comparison consumes the already monoidal category.
Retain coefficient flatness and its Tor obstruction. The fresh VI.8 proof
read confirms that this is an order correction, not a replacement proof.

### RT-AREA-geomlanglands/2 — classical-tower comparison has one late owner

Choose the verifier's option **ET.6a owns the comparison**. It already
depends on HS2, so no reverse ET.6a → HS2 edge is allowed. In ET.6a replace
the export “to HS3's Hecke-fibre comparison” by an owned tower-diamond/
minuscule-Hecke-fibre comparison, exported to ES7:GLn-comparison.
In HS2 replace “Match ... with known local Shimura moduli in examples”
by a pointer to ET.6a's comparison after both moduli constructions.
In ES7:GLn-comparison replace “HS2–HS3's identification” by ET.6a's
identification using HS2's Hecke-fibre moduli.

**Requested nodes in ET.6a:** Berkeley 24.2.5 at hyperspecial GL_n level;
extension to all tower levels K with transition maps; the O_E form needed
for E/Q_p; and the Drinfeld/EL comparison via 24.3.5 or the independently
constructed infinite-level duality. The ordinary p-divisible-group source
does not prove the O_E extension by notation alone. Retain the Rapoport–Zink
representability input and /22's general-field gap.

**Tests:** compatibility with GL_n(E), division-algebra and Weil actions,
finite-level quotient maps and the two towers' normalization. An isomorphism
of unacted diamonds at a single level is insufficient for ES7.

### RT-AREA-geomlanglands/13 — VS5 supplies Hecke ULA and duality

Add VS5 → HS1 and VS5 to HS1's Inputs sentence. Update
`HS1/properties-and-weil-equivariance` to import the **lisse** results
VII.7.6 and VII.7.9 from the /29 extension. Existing torsion D_et nodes
alone do not discharge these prerequisites.

**Tests:** preserve perfect pro-p invariants and the Bernstein–Zelevinsky
duality comparison in IX.2.2. Preserve the Hecke theorem's ℓ ≠ p range;
the later spectral-action good-prime condition does not belong here.

### RT-AREA-geomlanglands/14 — integral bounded properness follows Witt geometry

In `GS0:loop-geometry/schubert-bounds-and-properness` separate the generic
Div_Y/Div_X statements from the integral Div_𝒴 statement. The latter
belongs in GS0:Witt-geometry, after its lattice representability and BS17
projectivity comparison. Update both campaign sections and the split
packet/integrated node copies.

Do not preserve integral closedness in loop-geometry merely because it
sounds weaker: the verifier notes that the general-group proof obtains it
from quasi-compactness using a z-extension. Unless an independent proof
is supplied, move that integral closedness with properness. Add
GS0:Witt-geometry → GS0:Schubert-smoothness for the integral VI.2.4/VI.2.8
scope. HS0's ordinary Div_X Hecke fibres can use the generic theorem;
keep its Witt import only where an integral-family theorem is used.

**Tests:** generic bounded locus, special-fibre Witt locus, and descent
for a nonsplit group. Do not assume an arbitrary ramified G/E has a
reductive O_E model.

### RT-AREA-geomlanglands/15 — general positivity belongs to SF

In GS0:Witt-geometry replace “The required Keel ... is a sub-obligation
here” with an import of SchemeAndStackFoundations SF.5's general positivity
interface. That interface must explicitly include nef/big/semiample,
exceptional locus, Kodaira's lemma, Keel 1.7–1.9, finite-Frobenius descent
and the Stein factorization used. The accepted BS17 route is a plan for
these inputs, not evidence that SF.5 has already constructed them.

The `ampleness-via-keel` node retains the application to the Demazure
resolution, BS17 8.9–8.11 and §8.4's induction. Add SF.5 → Witt-geometry;
the SF.0 model/perfection input is already inherited. In
PAPER-BHATT-SCHOLZE-17 merge `keel-lemma-1-7` and `keel-lemma-1-8` into
the corresponding G817/G815 owners, updating incoming references. Move
G819's Stein-factorization ownership too if routed to SF; do not leave
the same generic theorem in route 14.

**Tests:** identify the actual exceptional locus and intersection numbers
before applying Keel; positivity of a named line bundle is a theorem.

### RT-AREA-geomlanglands/16 — full Prasad–Yu alternative, existing owner

Use the accepted KPZ26 item `prasad-yu-closed-immersion` in
ReductiveGroupsPartII RG2.3, and its existing edge to GS4. Widen that
item from residue characteristic > 2 to the full Corollary 1.3:
a reductive source over a DVR, finite-type affine target, generic-fibre
closed immersion, and **either** residue characteristic not two **or** no
normal geometric-generic subgroup of type SO_(2n+1). The target need not
be reductive. FS calls the corresponding result VI.11.4/[PY06, 5.2];
record the locator correspondence with the downloaded version.

In `GS4:integral-dual-group/dual-group-identification` name that import
and add the reduction through G_ad so the dual derived group is simply
connected in the ℓ = 2 case. Do not add another general GS4 theorem or
another duplicate edge.

**Tests:** a simply connected dual at ℓ = 2; an excluded odd-orthogonal
case that cannot use the theorem without another argument. Coordinate
PY02 with /4 in the same roadmap, but keep its **early** interface free
of RG2.3's building prerequisites; merging both results into a late stage
would recreate /4's ordering problem.

### RT-AREA-geomlanglands/17 — early abstract Tannaka supplier

Follow accepted PAPER-ZHU-17 ownership: split an early abstract MC.6
interface with no MC.5/motivic-period prerequisite. It supplies the
relative FS VI.10.2 reconstruction, the additional neutral representability
lemma, and Deligne–Milne 2.20/2.22. GS4:integral-dual-group imports it
and applies it to the Satake fibre functor. GS4:rational-reductivity uses
DM 2.23 with upstream ReductiveGroups layer 6 in characteristic zero.

Replace GS4's generic reconstruction proof by that import, retaining the
Satake-specific weight/root identification and integral recovery. Update
`tannakian-left-adjoint` without deleting the construction of its particular
adjoint. Do not reroute the accepted neutral theorem to a new group
roadmap, and do not call VI.10.2 specialized to vector spaces the entire
neutral theorem without the representability step.

**Tests:** reconstruction and its tensor/fibre comparison, finite-type
recognition and connectedness separately. None of these by itself proves
integral reductivity from a semisimple rational fibre.

### RT-AREA-geomlanglands/18 — scheme comparison inputs to GS1

Add AdicCoefficientsAndComparisons L1 and L3 → GS1. Replace the campaign's
“EDC.4–EDC.5 early scheme perversity/recollement” and corresponding link
label with EDC.5: EDC.4 is Lefschetz/projective bundles/blowups, not the
perverse recollement supplier. Remove the EDC.4 edge if this was its only
claimed role. The precise ECD §27 transport remains a named input to
`GS1/relative-perverse-t-structure` and the integral-family comparison.

Delete VS3 → GS2:correspondences and VS3 → GS3:fusion; their Chapter VI
torsion D_et construction supplies no D_lis use justifying those gates.
HS1 retains its own VS3 dependency.

**Tests:** move from the relevant perfect-scheme chart through the actual
étale comparison, preserving perverse shifts and flatness. Do not infer
scheme/diamond equivalence just from parallel definitions.

### RT-AREA-geomlanglands/19 — HS1 owns extension to perfect complexes

Assign the FS IX.2 extension to
`HS1/satake-kernel-and-solid-monoidal-functor`. GS4 exports the
finite-projective Satake equivalence; replace its claim to construct the
enhanced perfect-complex closure by an explicit pointer to HS1.

HS1 requests the split-dual-group highest-weight/base-change statement
needed to extend from representations to Perf(BĜ), and the exterior-tensor
generation used in IX.2.1/IX.2.3, for **all** ℓ ≠ p. Initially LP3 → HS1
is the verifier's valid supplier edge. When /24's common early Part II is
integrated, route the generic statement directly through that early
interface/reexport, rather than importing LP3's later cocycle-scheme
theorems merely for highest weights. LP4's parameter-stack generation is
not a substitute for the precise classifying-stack statement.

**Tests:** scalar extension to characteristic ℓ and exterior tensor
products. Do not carry VIII.5's dual-fundamental-group restriction into
integral Satake or the Hecke theorem.

### RT-AREA-geomlanglands/20 — rigid structure and the cohomology comparison

In HS2 add a node for the minuscule local Shimura rigid space, with its
étale period map and finite étale tower. The fresh Berkeley read clarifies
the locator: **24.1.2 is the non-emptiness proposition**; rigidification
is the following argument using 23.3.3, 19.4.2 and 10.4.2 before Definition
24.1.3. Cite that passage, not 24.1.2 as if it stated smooth rigid
representability. Non-emptiness is unnecessary for the representability
argument; an empty smooth space is allowed.

Import D6's étale-site comparison and the minuscule flag identification
from `GS0:Schubert-smoothness/open-cell-stabilizer-and-smoothness`, adding
the Białynicki–Birula map and its source proof if that node does not yet
provide it. Record this as remaining coverage until decomposed.

In `HS3/compactness-of-shtuka-cohomology` distinguish Huber's RΓ_c in
IX.3.1 from the diamond compact-support complex. Add an explicit comparison
request in the required higher-dimensional scope; the curve-only H3
interface is insufficient. Preserve compactness at pro-p level versus
finite-dimensionality of the whole tower.

**Tests:** minuscule GL_n at finite level and its diamond; coefficient,
support and level-transition compatibility of the two cohomology theories.

### RT-AREA-geomlanglands/21 — re-parent the sheaf-theoretic Demazure node

Move `HS0/demazure-generators-of-ULA-kernels`'s ULA-generation and
D_lis-preservation content to HS1. An optional purely geometric proper/
cohomologically smooth correspondence lemma can remain in HS0. Update
parentStageId, realises, coverage and incoming node links together; if the
ID changes, migrate every reference rather than leaving a dangling old ID.

HS1 already has the stage ancestry for GS1, VS2 and VS3, so no sheaf-theory
edges into HS0 are needed. The proposed “VS2 node for VII.4.3” does not
exist yet: use a truthful VS2 stage request and retain that source gap
until its node is supplied.

**Tests:** geometric correspondence can be constructed without a lisse
category; generation/preservation requires the actual VII.4.3 comparison.

### RT-AREA-geomlanglands/22 — general E is a separate coverage obligation

Keep `HS2/local-shtuka-moduli`'s Berkeley 23.1.1 construction explicitly
as E = Q_p. Add a general-E Hecke-fibre definition over HS0, or a sourced
O_E analogue with its extension status made explicit. Neither cited
source writes the requested general-E integral definition verbatim.
Add “general E, including equal characteristic, and comparison with the
Q_p integral-model definition” to HS2's coverage remaining list now.

For E = F_q((t)) do not reuse W(k)[1/p] as the coefficient field. Supply
the appropriate relative curve/period ring and Frobenius, twisted
Grassmannian bounds, reflex-field descent and both centralizer actions.
The general-E Hecke-fibre construction can be the canonical moduli functor;
comparison with an integral shtuka presentation is another theorem.

**Tests:** Q_p agreement, a ramified finite extension of Q_p, and
F_q((t)); equal-characteristic ES7/GlobalShtukas consumers cannot be
discharged by the Q_p case alone.

## Parameter stacks and spectral action

### RT-AREA-geomlanglands/4 — early fixed points and the dimension lemma

Separate smoothness/reductivity of prime-to-ℓ fixed points (PY02 2.1)
from LP3's later component-group and Donkin assertions. Give the former,
plus finiteness of unipotent conjugacy classes in a smooth group with
reductive identity component, an **early ReductiveGroupsPartII interface**
depending only on the required group/root foundations. It must not depend
on LP1 or buildings. Coordinate fixed-point smoothness with its accepted
Edixhoven route; smoothness is not PY02's reductivity conclusion.

Current-packet correction beyond the older finding: LP1 already has
`dimension-bound-lemma`, but its prerequisites include
`representability-flatness-and-lci`, the theorem whose proof needs it.
Remove that backward prerequisite. Make the finite-class theorem and
elementary dimension/fibre input its prerequisites; make the flatness/lci
node consume the dimension lemma, together with the cohomological-dimension
two/Euler-characteristic-zero calculation. Add a source/request for that
calculation, not an unproved field inside the conclusion.

**Tests:** finitely many unipotent strata, each bounded by dim H; then
relative dim Ĝ for the scheme and zero for its quotient stack. Keep
LP3's prime-to-ℓ component-group argument and solvability hypotheses in
their later owner. LP3 → LP1 would close a stage cycle and is not the fix.

### RT-AREA-geomlanglands/5 — abstract excursion operators once

Keep `LP2:excursion-presentation/map-to-a-bernstein-center` as owner of
VIII.4.1–VIII.4.2 and the relations from VIII.3.7. Correct the campaign's
“FS VIII.4's universal property” to name VIII.3.7 separately from the
categorical operator construction.

Extend the owner's target from an ordinary category to the required
stable enhanced category, with target **π0 End(id_C)**. Its current
`CatCenter` citation is not the whole enhanced construction. ES0 imports
this theorem for the HS1/HS4 Hecke datum on compact D_lis, and retains
the Bun_G/condensed continuity, nonsplit twisted action and centre
comparison. Replace the duplicate generic proofs in ES0's
`excursion-datum-and-operator`, `invariant-function-attached-to-a-datum`
and `excursion-relations-and-the-algebra-map` by these application/import
nodes after preserving useful explicit formulas and tests.

**Tests:** dependence only on the invariant function, multiplication and
finite-set reindexing; a centre element is natural in all objects, not
an arbitrary endomorphism of one chosen object.

### RT-AREA-geomlanglands/6 — Chapter X belongs to ES2/ES3

Apply the verifier's primary allocation: ES2 owns X.1.1–X.1.3, including
the sifted-colimit lemma; ES3 owns X.3.1–X.3.4 and the X.0.1/X.0.2
spectral-action statements. LP4 keeps VIII.5.1's representation-bundle
generation and module comparison. Its finite-free invariant-colimit
input comes from LP2:integral-invariants, via the edge in the graph plan.

Delete LP4's claim to own the universal property for exact monoidal
functors. In the **newer packet**, also migrate
`LP4/colimit-theorem-and-monoidal-universal-property`: it contains real
Chapter X statements, so correcting only the older integrated prose
would leave the duplication. Reuse those statements as ES2/ES3 evidence
or replace the node by an import, with all incoming references updated.
In ES's introduction replace “LP4 the separate categorical universal
property” by “LP4 the parameter-stack generation/module comparison;
ES2–ES3 prove the categorical action theorem”.

**Tests:** rational theorem versus integral sifted-colimit approximation,
spaces of coherent finite-set data, and the exact good-prime condition.
The fresh p. 348 read explicitly rules out the naive integral analogue.
Do not move that theorem back to LP4 via the original finding's discarded
alternative.

### RT-AREA-geomlanglands/7 — missing spectral-centre edges

Add ES1:spectral-center → ES7:parabolic, ES6:functoriality, ES6:duality,
ES4 **and ES2** (the verifier's additional consumer). Add VS5 → ES4 and
HS3 → ES4. The present campaign often names these inputs already; its
actual `requires`/stage edges must agree.

**Tests:** each centre-level comparison retains the |π0 Z(G)|-invertible
condition where IX.5.2 is used. The excursion-algebra route without that
condition remains available; this repair does not narrow ES5's field-valued
parameter theorem.

### RT-AREA-geomlanglands/8 — mod-ℓ admissibility before Schur

Plan an early SR.3b-style supplier after SR.2, independent of SR.6/ES:
admissibility of irreducible smooth representations over algebraically
closed characteristic ℓ ≠ p (Vignéras II.2.8), followed by scalar
endomorphisms. ES5's current representation node names Schur as a proof
step but has no such supplier; add the request and edge. Retain ES5's
separate proof that the endomorphism equality holds as condensed algebras.

**Correct the original evidence:** Qbar_ℓ is uncountable; the problematic
countable example is Fbar_ℓ. Do not perpetuate the false cardinality claim.
For an admissible irreducible representation, a nonzero finite-dimensional
K-invariant space lets an equivariant endomorphism acquire an eigenvector;
irreducibility then makes it scalar. The required admissibility theorem
remains a source-decomposition gap. Keep the eligible uncountable-field
Dixmier argument separate.

**Tests:** characteristic ℓ example and scalar-endomorphism map; do not
deduce the condensed equality from an unexplained abstract Schur axiom.

### RT-AREA-geomlanglands/9 — integral abelian centre in SR.1

SR.1 should own the Λ-linear centre of the **abelian smooth category**,
its pro-p Hecke-corner limit and ℓ-adic separatedness for
Λ = Z_ℓ[√q]. ES0 keeps the enhanced degree-zero centre and comparison.
Replace ES0:classical-center's assertion that SR.0 already defines this
centre with the SR.1 import. The newer ES0 packet's
`the-classical-center-as-a-limit-over-levels` must become a consumer or
move to SR.1, not remain a second generic construction.

The relevant SR.1 ancestry already exists; adding redundant edges is not
the mathematical repair. Keep the complex Bernstein block classification
in SR.3 separate. In particular do not give SR.1 an unsupported dependency
on SR.0:derived-extension merely to define its abelian centre.

**Tests:** the pro-p averaging idempotents require invertible pro-orders;
compare the transition maps of the corner centres and separatedness.

### RT-AREA-geomlanglands/10 — early z-extensions, existing z-embeddings

Add an early ReductiveGroupsPartII supplier for z-extensions with
induced-torus kernel and simply connected derived group, surjections
from induced tori, and π1 functoriality. Feed BG1, BG2:uniformization and
ET.0. Replace ET.0's generic construction by the import. The accepted
GLX26 D13 route to the downstream arithmetic Part II must also import
this early supplier, rather than serving as BG's foundation.

Keep **z-embeddings** in ES6:functoriality, as the verifier permits;
its consumers are already downstream. Replace the incomplete citation
“Kaletha §5” by [Rigid inner forms vs isocrystals](https://arxiv.org/abs/1502.00650),
§5, with the exact rational-point-surjectivity statements. This is not
the different KALETHA-16 routed paper. BG1 retains the Kottwitz-set
surjectivity theorem as an application of z-extensions.

**Tests:** distinguish extension (surjective group map) and embedding;
track the induced torus and π1 maps. No new unqualified LLC functoriality
is introduced.

### RT-AREA-geomlanglands/11 — the quasi-split reduction is a proof step

Add to BG1 the basic-class existence statement needed when Z(G) is
connected: a basic b0 with quasi-split inner form. Source its derivation
from Kottwitz Proposition 10.4 applied to Z(G) → G → G_ad and the
identification of basic adjoint classes with H1(E,G_ad).

Before ES7:parabolic's increasingly unstable b_N argument, insert the
actual reduction: take the ES6 z-embedding with connected centre;
prove the Bun fibre-product identification and injectivity on B(G);
use the basic b0 and the Hecke-equivariant inner-twist equivalence from
BG; check G'_(b')(E) = Z'(E)G_b(E) using Kaletha Fact 5.5. Then apply
the quasi-split argument and descend the comparison.

**Tests:** basic inner form, connected-centre reduction and the exact
twisted Levi cocycle. A named “quasi-split reduction” without these maps
does not close IX.7.2.

### RT-AREA-geomlanglands/12 — global-function-field infrastructure is imported

Replace ES7:function-field-automorphic's generic restricted-product,
diagonal, Haar-measure and degree/central-quotient construction with
imports from FunctionFieldArithmetic FA.2/FA.6 and AdelicAlgebraicGroups
AA.0. Add AA.0 → that stage; FA.2 is already inherited through FA.6.

Keep maximal orders of the division algebra, compactness modulo centre,
discrete decomposition, kernel trace identity, Euler–Poincaré functions,
simple trace comparison and globalization in ES7.

**Tests:** the inherited Haar normalization and degree lattice agree with
the division-algebra quotient; neither compactness nor the trace identity
is supplied by defining a restricted product.

### RT-AREA-geomlanglands/23 — unconditional quotient before good-prime invariants

Move the construction of the finite-wild invariant ring/coarse affine
quotient, its invariant-map universal property, transitions and geometric
closed-orbit description into LP2:excursion-presentation. Keep the
good-prime excursion **isomorphism**, higher-cohomology vanishing and
base-change theorem in LP2:integral-invariants. Do not add the latter
stage as a prerequisite of its earlier consumer.

Update `excursion-algebra-and-universal-homeomorphism`, the semisimple
character nodes, and SR.6's finite coarse-quotient map to consume this
early interface. Take the GIT inputs from accepted BHKT-19/4 and
LAFFORGUE-18/35,/42; BHKT-19/6's DVR/base-change input stays late.
Rejected /3 does not authorize a new duplicate GIT roadmap.

**Tests:** at a bad prime preserve the universal homeomorphism and
geometric-character bijection without asserting an integral ring
isomorphism. A full Weil–Deligne monodromy operator is not recovered.

### RT-AREA-geomlanglands/24 — use the accepted integral-representation Part II

The generic highest-weight supplier is the already routed
`ReductiveGroupsIntegralRepresentationsPartII`, not another RG2.6.
Extend its design brief with induced/Weyl/dual modules over Z and fields,
Kempf vanishing, Donkin's criterion, Donkin–Mathieu tensor stability and
the Koppinen/Donkin filtration of O(G). The accepted KPZ26 route already
requires an integral construction and warns about root operators killed
in characteristic p; retain that warning and its minuscule restrictions.

LP3 imports this general theory for its cocycle-algebra, fixed-subgroup
and invariant-cohomology results. PotentialAutomorphyInfrastructure PA.1
imports it for GL_n-specific linkage and bounds. Add the common-owner
edges in that design, coordinating HS1's early need in /19.

**Tests:** SL2 in characteristic p, a root coefficient killed by p,
base change and tensor filtration; no import of characteristic-zero
semisimplicity as a substitute for an integral theorem.

### RT-AREA-geomlanglands/25 — one parameter-reconstruction theorem

Make LP2:semisimple-characters the common abstract reconstruction
interface for a profinite/condensed group with the specified finite
pinned-action quotient, following accepted LAFFORGUE-18/34,/42. State
continuity as an actual part of the required input/output comparison.
Add LP2:semisimple-characters → GlobalShtukas GS.5. GS.5 retains its
shtuka-specific operators, relations and global Galois application per
RS-22; it imports abstract reconstruction rather than proving it again.

**Tests:** conjugacy class rather than canonical representative, nonsplit
action, and characteristic ℓ complete reducibility. Do not replace
continuity by the existence of an abstract group homomorphism.

### RT-AREA-geomlanglands/26 — one cocycle scheme over Z[1/p]

Change LP1's base construction from Z_ℓ to Z[1/p], using the pinned
integral dual group and the ℓ-independent finite presentation. State its
Z_ℓ models as base changes and identify the DHKM/FS discretization
conventions. The current flatness node already notes this integral model
in its hypotheses; turn that observation into the common construction.

SR.6 already depends on LP1. Replace its separate cocycle construction
by the LP1 import and retain the DHKM finiteness/Hecke-algebra conclusions.
Coordinate any later RS-21 acceptance; do not let its “integral finite-wild
cocycles” language recreate a second owner.

**Tests:** two primes ℓ ≠ p, change of tame generator, twisted conjugation
and compatibility of the base-change maps. Coincidence of geometric
points is not the functor-of-points comparison.

### RT-AREA-geomlanglands/27 — import fpqc foundations only

Add SchemeAndStackFoundations SF.1 → LP1 and replace the local generic
fpqc descent/ordinary quotient-stack interface by that import, consistent
with accepted RS-25 and VANHOFTEN-24 routing.

Do **not** move LP1's derived affine/QCoh/Perf work to E5 as part of this
fix: the verifier rejects the purported S.1 duplicate. S.1 owns scheme
locally perfect complexes, not all derived quotient-stack Perf. Retain
the parameter-stack derived comparison, tangent/obstruction construction
and any genuinely missing stacky derived foundations as explicit work.

**Tests:** quotient stack retains stabilizers; the coarse invariant quotient
does not replace it, and equality of ordinary points does not prove the
derived comparison.

## Solid/lisse coefficients and algebraic B(G)

### RT-AREA-geomlanglands/28 — remove irrelevant coefficient gates

Delete AdicCoefficientsAndComparisons L1, L3, L4, L5, L6 → VS3, retaining
L0. Put L1 → GS0:loop-geometry and L3 → GS1, together with /18's explicit
GS1 L1 input. L4–L6 retain their actual scheme-side EDC.6/EDC.7 consumers.

**Tests:** VS3's construction and its descendants remain supplied by the
VII.6 solid/lisse operations without waiting for alterations merely due
to an inherited link. The genuine §27 comparison is available to the
Chapter VI perfect-scheme chart calculations that use it.

### RT-AREA-geomlanglands/29 — add lisse duality and the lisse ULA definition

Preserve the existing three VS5 nodes as the torsion D_et results of
Chapter V. Add separate lisse nodes for VII.7.6, VII.7.7,
Definition VII.7.8, and VII.7.9–VII.7.10 over VII.6's discrete Z_ℓ-algebras,
including Q_ℓ with the prescribed condensed interpretation.

Their inputs include VS4's VII.7.2 left adjoint and the /30 solid
partial-support vanishing theorem. Put VII.7.2 in VS4, not VS5.
The fresh p. 275 read confirms that FS **omits** the lisse reflexivity
analogue of V.6.2; do not fabricate a sourced node for it. Define lisse
ULA by the actual dualizability comparison on the product and prove
equivalence with perfect K-invariants, rather than importing the torsion
definition without a comparison.

Add the VS5 → HS1 edge once (shared with /13).
**Tests:** a perfect Z_ℓ invariant complex, rational coefficients,
Bernstein–Zelevinsky involutivity on the stated compact subcategory,
and a nonperfect invariant complex that does not satisfy the ULA test.

### RT-AREA-geomlanglands/30 — keep the solid core independent of the curve

Narrow VS2's Chapter VII scope to the generic VII.2.1–VII.2.6 and VII.3
operations, preserving its separately named VII.4/VII.5 comparisons.
Put Definition VII.2.9 and Theorem VII.2.10 in VS4, before their
VII.7.2 compact-generator use. Put VII.2.7–VII.2.8's divisor/Weil
application there too, so HS1 can import it through VS4. VS4 already
has VS0/VS1 and the relative-curve prerequisites.

Do not add VS1 → VS2: the verifier selects this ownership split to
avoid making generic solid modules, including their Habiro consumers,
wait on curve/bundle classification. Update the current
`VS2/solid-sheaves-on-v-stacks` scope and coverage accordingly; a broad
source-range citation must not hide the moved theorems.

**Tests:** generic solid coefficient construction on a point; the separate
partial-support vanishing application on the Bun_G chart. Keep partial
support/relative homology distinct from unqualified ordinary f_!.

### RT-AREA-geomlanglands/31 — geometric simple connectedness before Drinfeld

Add the Fargues–Fontaine finite-étale classification to
VectorBundlesAndIsocrystals VB2:classification, using FF18 8.6.1 /
Berkeley 13.5.7 and the bundle classification. State it accurately:
finite étale O_X-algebras correspond to finite étale E-algebras; after
geometric base change the curve is simply connected. The arithmetic
fundamental group is G_E, **not** the trivial group.

Berkeley's proof uses the perfect trace pairing, slopes, and reducedness
to force all slopes of the algebra bundle to zero, then recovers its
finite étale coefficient algebra from global sections. Preserve that
algebra structure, not just triviality of the vector bundle. Its
Q_p presentation needs a justified E-general version, including equal
characteristic, before exporting to FS's full scope.

VS1 adds the 16.3.2 finite-étale-cover comparison, assembled from F2/F3
and this theorem, as Drinfeld's lemma's input. VB2 ancestry is already
present. Do not add 16.3.3/16.3.6's stronger product-π1 apparatus, or the
ClassFieldTheory layer-9 link explicitly declined by the accepted link
screening, merely because they are neighboring source passages.

**Tests:** the finite-étale algebra/cover equivalence, persistence under
the algebraically closed perfectoid base, and the E = Q_p special case.

### RT-AREA-geomlanglands/32 — split both algebraic B(G) stages

Separate BG0's algebraic B(G), G-isocrystals, J_b and inner-Levi
description from its analytic torsor comparison. Its early prerequisites
are VB0 and the necessary reductive-group foundations, not RF0–RF3/A4/VB1.
Also split BG1's algebraic Kottwitz/Newton/partial-order part from the
torsor-kernel and analytic comparisons. Splitting BG0 alone would still
make the BG1 → IG.0 import carry the analytic dependency chain.

In the early BG1 part explicitly implement the already routed B(G,{μ})
condition κ(b) = μ^natural and ν_b ≤ μ^diamond, with the chosen convention
for μ versus μ^(-1). Feed the early BG0/BG1 interfaces to IgusaVarieties
IG.0, and the early J_b interface to ET.5. IG.0 retains its PEL-specific
Newton map and admissibility proof; ET.5 retains its endoscopic use.

**Tests:** torus, GL_n slopes, centralizer inner form and dominance
orientation. Preserve the nonbasic automorphism-v-group distinction:
these algebraic results alone do not identify Bun_G^b with [*/J_b(E)].

## Graph validation and integration order

A read-only check removed the nine edges below from the current
`data/atlas.json` graph, then added the twenty listed edges in order,
searching for a reverse path before each addition. All endpoints exist;
all nine removals were present; none of the additions closed a cycle.
This checks the combined **existing-stage** edits, not the not-yet-created
early interfaces or pending accepted restructure links.

Aliases: GS = GeometricSatakeAndFusion; ES = ExcursionOperatorsAndSpectralAction;
VS = VStackSheavesAndLisseCategories; LP = LanglandsParameterStacks;
HS = HeckeStacksAndLocalShtukas; AC = AdicCoefficientsAndComparisons;
SF = SchemeAndStackFoundations; EDC = EtaleDualityAndPerverseSheaves;
AA = AdelicAlgebraicGroups; Global = GlobalShtukasAndFunctionFieldLanglands.

```text
REMOVE
GS/GS3:fusion -> GS/GS2:Satake-closure
VS/VS3 -> GS/GS2:correspondences
VS/VS3 -> GS/GS3:fusion
AC/L1 -> VS/VS3
AC/L3 -> VS/VS3
AC/L4 -> VS/VS3
AC/L5 -> VS/VS3
AC/L6 -> VS/VS3
EDC/EDC.4 -> GS/GS1

ADD
GS/GS2:Satake-closure -> GS/GS3:fusion
LP/LP2:integral-invariants -> LP/LP4
ES/ES1:spectral-center -> ES/ES7:parabolic
ES/ES1:spectral-center -> ES/ES6:functoriality
ES/ES1:spectral-center -> ES/ES6:duality
ES/ES1:spectral-center -> ES/ES4
ES/ES1:spectral-center -> ES/ES2
VS/VS5 -> ES/ES4
HS/HS3 -> ES/ES4
VS/VS5 -> HS/HS1
AA/AA.0 -> ES/ES7:function-field-automorphic
GS/GS0:Witt-geometry -> GS/GS0:Schubert-smoothness
SF/SF.5 -> GS/GS0:Witt-geometry
AC/L1 -> GS/GS0:loop-geometry
AC/L1 -> GS/GS1
AC/L3 -> GS/GS1
EDC/EDC.5 -> GS/GS1
LP/LP3 -> HS/HS1
LP/LP2:semisimple-characters -> Global/GS.5
SF/SF.1 -> LP/LP1
```

Next integrate the early group, MC.6, integral-representation, SR and
BG splits; assign IDs through the maintainer's normal reservation process;
reconcile accepted routes and all node-level references; rerun the full
graph checks. The tested LP3 → HS1 edge is conservative pending /24's
more precise generic supplier. Do not treat acyclicity as proof that a
supplier exports the required theorem.

## Checks and remaining work

The report's 31 unique finding headings are checked against the issue and
confirmed verifier verdicts. The two output paths pass intake scope/text
checks, and `git diff --check` passes. Inputs were
parsed as JSON. No packet, link, paper, restructuring or Lean file is
modified, so no validator result or Lean compilation is claimed for the
proposed target edits.

The maintainer must still apply the changes, validate packets/links/routes,
and review the missing source decompositions. In particular the early
fixed-point interface, mod-ℓ admissibility, general-E moduli, Huber/diamond
RΓ_c comparison, integral highest-weight extension and new lisse nodes
are requests with explicit proof boundaries, not completed mathematics.
