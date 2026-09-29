# RT-AREA-ktheory-2: fixes and maintainer edit instructions

Agent: Codex. Session: `codex-rtOQ9t`. Job: `FIX-RT-AREA-ktheory-2`.
Issue: #3980. Read date: 2026-09-29.
Repository snapshot: `fac4819e02bdf348a0f93d259ad2b28a27236aae`.

## Scope and status

This is a **report-only submission**, not a claim that the roadmap edits below
have been applied or that their mathematics has been formalised. The queue gives
this job one output, this report. `research/blueprint/intake.py:own_files`
permits the output and the job's handoff; `auto_refusals` rejects other paths.
The issue's broader instruction to edit target files therefore cannot be
implemented within its current intake allowlist. As in the existing
`RT-AREA-iwasawa-3.fixes.md`, the changes below are instructions for the
maintainer and the owning blueprint jobs. No packet, campaign document,
generated atlas extract, review verdict or reservation was changed here.

All 45 findings enumerated by #3980 have a disposition below. A finding being
covered in this report does **not** mean its outstanding edits are complete.
The verifier rejected /34; retain the existing distinction between Bökstedt's
construction and Bökstedt periodicity. The confirmed low-severity /47–/52 were
not enumerated in this fix issue and are not silently included in its scope.

Newer packets already address parts of this older red team. Read their current
nodes before applying an instruction: preserve valid statements, source gaps,
API and tests, and change the owner/prerequisite rather than constructing a
second copy. The packets for EllipticKTheory, EllipticRegulators,
HabiroNumberFields, K3BlochGroups and Polylogarithms have accepted reviews but
remain partial. SchemeKTheoryOperations is partial and has no review object;
there is no RefinedTraceMethods packet at this snapshot.

## Evidence and application convention

Read the result and verification JSON, the seven campaign documents and their
atlas stages, the six available packets, the reviewed library audit, and the
upstream DGAInfinity and GrothendieckEulerForms roadmaps. The latter two were
read in full: DGAInfinity layers 5, 8 and 9 supply distinct interfaces, not a
generic assertion that all derived or cyclic mathematics already exists.

Library baseline remains Mathlib `082e2d3`, Tau Ceti `f790474`. This report
does not add a new library declaration citation or claim a fresh exhaustive
library search. Existing packet library references and the reviewed audit
are inherited evidence; they must be checked against actual pinned statements
when implementing new signatures. In particular, do not reconstruct existing
Weierstrass arithmetic, formal power series or condensed modules merely to
make a local dependency list self-contained.

Sources freshly inspected in this session (public versions, 2026-09-29):

| Source | Passages used | SHA-256 for downloaded PDF |
| --- | --- | --- |
| [Weibel, K-book IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | finite generation, §6, Theorem 6.9 and context | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| [Weibel, K-book VI](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.VI.pdf) | Theorem 4.7; §5 comparison; Harder's Theorem 6.1 and its proof | `efca16d77ed598735aa4e819be48d10d35bec0cf1b4138548f94f67922d40cd1` |
| [Calegari–Garoufalidis–Zagier v3](https://arxiv.org/pdf/1712.04887v3) | Lemma 3.5; §4.2; §7.2, Theorem 7.4 and its proof | `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5` |
| [Hutchinson v4](https://arxiv.org/pdf/2104.14413v4) | Theorem 3.1, Lemma 4.1 and ensuing Bott-element argument | `e7a358154bf29701afcb1feb2308287f90e0fe405813d9548879dd5b2f2f30bf` |
| [Wagner v1](https://arxiv.org/html/2510.06057v1) | introduction, especially Theorem 1.6 and its role in §4 | HTML; no PDF hash claimed |

These are passage reads, not claims to have decomposed the papers completely.
Locators below attributed to the verifier but not in this table remain
**inherited source leads**. In particular the proofs in Devalapurkar's thesis,
Burklund, Keune, Hutchinson (2013), and the full Meyer–Wagner construction were
not independently read here. Their missing inputs remain gaps; a theorem name
and a request do not close them.

For each edit, the campaign target is `content/campaign/<owner>/README.md`,
the packet target is `research/blueprint/packets/<owner>.json` when present.
Stage IDs below identify the precise section. Update the source of stage
requirements using the maintainer's integration process; regenerate
`data/atlas.json` and `research/blueprint/atlas/roadmaps/*.json`, rather than
hand-editing generated extracts. Propagate owner corrections to integrated
decompositions when they contain the same node. Arrows below always mean
**supplier → consumer**.

## Elliptic curves and regulators

### RT-AREA-ktheory-2/1 — finite curves need finite-curve inputs

**Current state:** E.5 now warns that the finite-curve theorem needs more than
the finite-field calculation. Its packet node
`E.5/an-elliptic-curve-over-a-finite-field` still points to number-field
finite generation and an elementary Milnor-examples input; it records the
Geisser–Levine/Weil gap. Do not delete that gap as a duplicate of L.1.

**Edits:** In ArithmeticKTheory N.3:finite-generation, add a separate
function-field branch: finite generation of K-groups of smooth affine curves
over finite fields, and its proper-curve consequence by localization
(K-book IV.6.9). Keep it distinct from rings of integers of number fields.
In K2SymbolsBrauer T.4, request Bass–Tate's vanishing of Milnor K in degrees
at least three for global function fields. The verifier corrects the proposed
owner to T.4, not T.5. In MotivicEtaleKTheory M.5d, request Geisser–Levine's
characteristic-p field comparison (VI.4.7): finite-coefficient Milnor/Quillen
comparison, absence of p-torsion, and unique p-divisibility of comparison
kernel/cokernel. These are three outputs, not interchangeable conclusions.

Replace E.5's number-field finite-generation prerequisite with the new
function-field supplier and add the T.4 and M.5d requests. Its proof should
then follow VI.6.1: localization, finite-field groups, unique p-divisibility,
and finite generation give finite groups of order prime to p. Handle the
low degrees by the source's preceding low-degree calculation. For an explicit
elliptic Frobenius formula separately import the Jacobian/Tate-module,
étale-comparison and Weil inputs; Harder's finiteness theorem alone supplies
no Frobenius eigenvalue calculation.

**Acceptance:** P¹ and a positive-genus proper curve; distinguish an affine
curve's units in K1 from the proper case; test that finite generation alone
does not imply prime-to-p order. Keep E.5's existing qualified pull–push
formula `[f_* O] · a`; no new degree-multiplication assertion is justified.

### RT-AREA-ktheory-2/4 — residue-field K2 in E.3

**Current state:** E.3 already distinguishes the image of K2(X) from K2(X)
and integral from rational injectivity. Preserve the nodes
`what-the-sequence-does-not-identify` and
`integral-injectivity-over-a-finite-field`.

**Edits:** Make the source chain explicit: N.2 localization, N.3:ranks and
the tame-kernel finiteness input T.5 give torsion K2 of number fields;
KTheoryFiniteLocalFields L.1 gives K2 of finite fields equal to zero.
Add these suppliers to the E.3 stage and to the corresponding proof nodes
where absent. Apply them to every residue field k(x), not just rational
points. The direct sum of torsion groups is torsion, which is sufficient
after tensoring with Q; no uniform exponent is needed.

**Acceptance:** one non-rational closed point over a number field and one
over a finite field. The first gives rational injectivity only; the second
gives integral injectivity.

### RT-AREA-ktheory-2/5 — import the CM character

**Current state:** `ER.5/the-CM-setup-and-the-hecke-character` already imports
ComplexMultiplication CM4. The campaign still tells ER.5 to construct the
general character and prove Deuring's theorem.

**Replacement for ER.5's first paragraph after the CM hypotheses:**
“Import the CM character, conductor and Deuring Euler-factor comparison from
ComplexMultiplication CM1 and CM4. Specialize them to Bloch's maximal-order,
class-number-one setup, checking the bad Euler factors and the convention for
the character used in Lecture 11.” Add CM4 → ER.5. Retain ER.5's construction
of C = fg, finite character, Gauss/Fourier data and U; these are the
application, not duplicates of CM theory.

**Acceptance:** match the conductor and character convention before using
the already transcribed scalar in the campaign. Do not generalize to arbitrary
orders or class number without another theorem.

### RT-AREA-ktheory-2/6 — modular units have an early owner

**Current state:** the ER packet requests KatoEulerSystems L0 and compares
its modular units with the source-specific units. This is useful progress.

**Edits:** Replace “Construct modular units, their divisors at cusps” in
ER.7 with “Import the modular units and cusp-divisor formulas from the early
modular-unit part of KatoEulerSystems L0; identify the chosen source's units
and their normalizations with that interface.” Preserve ER.7's particular
K2 symbol, tame-residue, regulator and modular-parametrization proofs.
The supplier must precede the Euler-system/Iwasawa endpoints of Kato's
roadmap: use its early node, not an entire late roadmap as a prerequisite.

**Acceptance:** compare both the functions and cusp multiplicities;
matching names is insufficient. Retain the existing Schappacher–Scholl
source-access/integral-statement gap until its theorem and §7 are inspected.

### RT-AREA-ktheory-2/7 — one Deligne complex and one curve formula

**Current state:** the newer ER packet imports the general P.5 curve formula
and requests M.8 foundations. The campaign still reconstructs both.

**Edits:** Split MotivicEtaleKTheory M.8 into an early real-Deligne foundation
and its later comparison applications, as specified in /24. Replace ER.2's
opening construction with an import of that complex and hypercohomology,
then compute the elliptic, weight-two target with its embeddings,
conjugation action and period quotient. Import P.5's general curve symbol
regulator, Steinberg relation and boundary/current formula. ER.2 owns the
elliptic specialization, orientation/2π normalization comparison and the
torsion-lift argument; ER.4 owns the elliptic divisor evaluation.

**Acceptance:** a single definition of η(f,g) is used in P.5 and ER.2;
residue cancellation and the actual comparison map, not an arbitrary scalar,
determine the normalization. Do not add unsplit M.8 → R.7: R.7 → M.8 is
already present.

### RT-AREA-ktheory-2/8 — import de Rham–Betti comparison

**Current state:** ER.1 has a C.5 request; C.6 is not an explicit supplier.

**Edits:** In ER.1 replace the generic de Rham/singular comparison proof
with imports of AlgebraicCurves C.5–C.6 (and the corresponding early
PeriodsAndSpecialValues comparison interface where used). Retain elliptic
uniformization, the chosen oriented lattice, q = exp(2πiτ), and the elliptic
period computation. Add the actual C.6 pairing/nondegeneracy prerequisite
to the period-matrix node; a stored invertible matrix is not a proof.

**Acceptance:** orientation reversal and change of lattice basis, with
conjugation across all embeddings of the number field.

### RT-AREA-ktheory-2/9 — functional equation hypotheses

**Current state:** `ER.6/beilinson-forms-equivalent` now gives the conductor,
gamma factors and explicit scalar conditional on a functional equation.
Keep this improvement.

**Edits:** Add EllipticCurveModularity R29.6 → ER.6 for E/Q and import that
theorem in the unconditional specialization. Keep the general-number-field
statement conditional on the specified analytic continuation and functional
equation; do not infer it from a formal completed L-function definition.
For d = [F:Q] and the packet's N, check directly that
Λ(s) = N^(s/2)(2π)^(-ds)Γ(s)^d L(E,s) and
Λ(s) = wΛ(2-s) give L*(E,0) = w N(2π)^(-2d)L(E,2).

**Acceptance:** d = 1 and a symbolic general d expansion at s = 0;
distinguish leading coefficient from the zero value L(E,0).

### RT-AREA-ktheory-2/10 — suppliers for ER.8 examples

**Edits:** Add ER.5 → ER.8 for the CM class and E.6 → ER.8 for the
arithmetic-model integral part. The packet's explicit example nodes already
name these objects; preserve their prerequisites when integrating the stage
edges. ER.4 alone supplies neither the CM theorem nor vertical integrality.

**Acceptance:** the CM example points to the actual U with its normalizations;
the model example includes a vertical residue certificate.

### RT-AREA-ktheory-2/11 — p-adic integration and L-functions

**Current state:** the packet imports ColemanIntegration L1 and
ModularSymbolsPadicLFunctions L1–L2, while retaining missing source detail.

**Edits:** Carry those imports into ER.8's campaign/stage dependencies and
into PadicHodgeRegulators D.5 where its comparison uses Coleman integrals.
ER.8 specializes the integration and p-adic L-function interfaces, including
period and exceptional-factor choices; it does not construct either again.

**Acceptance:** keep good-reduction and ordinary/supersingular restrictions
of the selected theorem separate. No conjectural p-adic formula becomes a
premise of the real CM theorem in ER.5.

### RT-AREA-ktheory-2/12 — vertical certification depends on models

**Current state:** E.7's packet has an integral-certificates node; E.6 owns
vertical residues. ER.6's potentially-good-reduction specialization is not
a duplicate of the general model theory.

**Edits:** Add E.6 → E.7 and propagate it to E.8's completion tests. ER.6
imports the E.6 image/vertical-residue comparison, then proves the
application-specific membership theorem. Preserve horizontal certificates
as a weaker independent output.

**Acceptance:** a tame-unramified generic symbol must not be accepted as
arithmetically integral until its vertical certificate is supplied.

## Habiro, Bloch groups and polylogarithms

### RT-AREA-ktheory-2/2 — move the final exponent comparison later

**Current state:** HB.2 has separate `scalar-from-eta`,
`chern-class-of-eta` and unknown-power comparison nodes. Its
`hutchinson-refinement` node explicitly records the missing CGZ 7.4 input
and the stage cycle, but still lives in HB.2. This is not a closed proof.

**Edits:** Keep the unknown invertible power in HB.2 and the independently
proved finite Chern calculation with all its hypotheses. Move the final
R_ζ = c_ζ² theorem to HabiroNahmSeries HB.5, after HB.4, HB.5a and HB.2.
Replace its proof's reference to the unprovided
`HB.4/acceptance-andrews-gordon` with a real HB.5 CGZ Theorem 7.4 supplier.
That supplier must construct η_ζ from CGZ (34), A_n = (2 min(i,j)),
the rank-(n-3)/2 Nahm sum, its product (45), and both radial asymptotic
calculations. Request Andrews–Gordon and the needed Jacobi product identities
from QSeriesPartitionsAndMockModularForms QM.0, and the theta/eta modular
transformation from QM.1. Add QM.0, QM.1 → HB.5 and HB.5 → HB.9.

The source proof also uses the Rogers-dilogarithm evaluation in CGZ (47):
name its P.1 supplier or an explicit gap; a q-product identity alone does not
close Theorem 7.4. Test n = 3's zero-dimensional sum separately and n = 5's
Rogers–Ramanujan specialization before arbitrary odd n. Hutchinson Theorem
3.1 is stated first at an odd prime power; provide the CRT/prime-power
passage when exporting arbitrary admissible odd n.

Preserve HB.2's existing sign-convention gap: Lemma 4.1 prints a minus sign
in the cup-product calculation followed by a plus in the tensor expression.
This report does not certify that normalization as resolved. Keep the
abstract scalar-from-evaluation argument independent of a chosen sign, and
close the sign comparison before asserting its value is 2.

Do **not** move the definition ε_m(ξ) = c_(ζ_m)(ξ)² out of HB's exported
interface. That definition exists independently of R_ζ and is used for all
m; only its identification with R_ζ has the good-n and late-proof conditions.
Moving every ε-dependent node would introduce unnecessary cycles.

### RT-AREA-ktheory-2/13 — finite-field Bloch comparison

**Current state:** V.5 now has finite-field Bloch nodes and small-field tests.
`bloch-finite-field-mod-n` nevertheless cites V.4's infinite-field Suslin
node as if it supplied the finite-field theorem. The source/gap discussion
already recognizes the missing justification.

**Edits:** Introduce a distinct V.5 request for the finite-field
Bloch–Wigner/Hutchinson comparison used in CGZ §4.2 and Lemma 4.4. Change
`bloch-finite-field-mod-n`'s first proof step and prerequisite to that
supplier; revise the source `match` that currently says it follows from
the existing V.4 node. If V.4 is instead extended to the full |F| ≥ 4
statement in K-book VI.5.2, decompose and source the extension explicitly;
its present infinite-field contract is insufficient.

Use q ≥ 4, odd n, gcd(n,q-1) = 1 for the current quotient theorem. For
q ≡ -1 mod n the target is Z/n. Do not introduce the unqualified integral
assertion H3(SL2(F_q), Z) = Z/(q²-1) from the original proposed fix:
small-field characteristic-primary exceptions need separate treatment.
Specify the prime-to-characteristic/odd-coefficient part actually used by
CGZ, and its maps, before adding any stronger theorem. Add V.5 → HB.2.

**Acceptance:** retain q = 5, n = 3 and q = 11, n = 3; retain the negative
q = 7, n = 3 test where gcd(n,q-1) fails. Preserve the packet's explicit
q = 2,3 convention exceptions. A coincidence of cyclic orders alone does
not prove compatibility of the Chern/Bloch maps.

### RT-AREA-ktheory-2/14 — Keune's input to actual units

**Current state:** the HB packet records the Keune gap. It has no complete
arithmetic supplier that discharges `units-realise-c-zeta`.

**Edits:** Add an N.6 request for the Keune injection used in CGZ Lemma 3.5,
from the χ⁻¹-coinvariant quotient of the p-power quotient of the localized
cyclotomic Picard group to K2(O_F)/p^m. Add N.6 → HB.1 and M.3's Kummer
sequence as the cohomological supplier. Keep this as a source/proof gap
until Keune's actual statement, hypotheses and convention are inspected.

The unit proof must retain each step: reduce to p-powers; use p odd,
p ∤ disc(F) and p ∤ |K2(O_F)|; kill the Picard obstruction; then kill
the valuations at p in the χ⁻¹-component using total ramification and the
nontrivial cyclotomic character. An S-unit lift is only the intermediate
conclusion. Do not replace χ⁻¹-coinvariants by invariants without the
finite-module argument CGZ uses.

**Acceptance:** a request for units must fail when only S-unit data are
provided, or when one of the excluded prime hypotheses is absent.

### RT-AREA-ktheory-2/15 — p-adic regulator supplier chain

**Edits:** Add D.1 → D.2 and V.4 → D.2. D.2 imports the p-adic
dilogarithm and Bloch–Suslin comparison before its regulator formula;
D.3, D.4 and HB.7 inherit them. In HB.7 retain the concrete local-section
construction and its exact GSWZ normalization, rather than treating a
general p-adic comparison as the explicit formula.

**Acceptance:** follow one symbol through the Bloch quotient, p-adic
dilogarithm and GSWZ regulator with the same sign/twist convention. The
finite-Chern comparison from /18 is an additional input, not a substitute.

### RT-AREA-ktheory-2/16 — remove the unrelated HB.6 gates

**Current state:** HB.6's coefficient-rings-and-Frobenius node already
imports HabiroRings HR.1. The old stage/checkpoint prerequisites remain.

**Edits:** Delete M.1 → HB.6 and the corresponding forwarded cohomology
link in RS-08's source/integration record. Add HR.1 → HB.6. For
KU-habiroring delete KU-continuous and KU-existing as mathematical gates
and use the HR.1 coefficient-ring interface. Preserve HC.3 and genuine
Frobenius/gluing requirements.

**Acceptance:** coefficients are the specified tensor rings, including
R ⊗ Z[ζ], not automatically fields; completion and root-of-unity gluing
must still be proved. A dependency deletion does not simplify the algebra
by assumption.

### RT-AREA-ktheory-2/17 — Bloch conventions belong to V.3

**Current state:** HB.1 imports the explicit V.3 convention-comparison
nodes. Keep that; the campaign and PLAN-HABIRO §4.2 need the same routing.

**Edits:** V.3 owns the presentations, maps, torsion kernels/cokernels and
odd-coefficient comparison. Replace HB.1's local convention construction
with those imports and add V.3 → HB.1 if not already inherited. HB.1
retains its application to the finite regulator and root-of-unity action.

**Acceptance:** never use an integral inverse when only the odd-coefficient
comparison is an isomorphism; the two Bloch conventions remain distinct.

### RT-AREA-ktheory-2/18 — finite Chern classes need an early interface

**Current state:** HB.1/HB.2 request M.8, but the current whole M.8 stage
depends on R.7 and D.2. It cannot also supply their foundations unchanged.

**Edits:** In M.8 separate an early finite-Chern interface from the later
real/p-adic comparison stage. It receives the required finite-coefficient
K-theory and étale cohomology operations and exports the Chern map,
naturality and precisely sourced product formula. HB.1, HB.2 and D.2
import it. Keep the later comparison theorem dependent on D.2 and R.7.
Audit M.7 at node level: importing all its trace-dependent work as a
foundation can reintroduce the cycle. Do not assert an unrestricted
coefficient-ring product when the source uses odd coefficients or other
multiplicativity restrictions.

**Acceptance:** Bott element, cup product, Tate twist and minus sign are
checked together, including the unresolved normalization in /2. This
request supplies no new proof of the product formula by itself.

### RT-AREA-ktheory-2/19 — general Bass–Tate theorem, degree-three consumer

**Current state:** V.2's `milnor-k3-number-field` states the correct
degree-three result and tests Q and Q(i), but its proof records an unread
Bass–Tate source rather than an arithmetic supplier.

**Edits:** Put the general number-field theorem in T.4: for n ≥ 3,
Milnor K_n(F) is the elementary 2-group detected by the r1 real signatures.
Keep it distinct from the global-function-field vanishing in /1. Add a
request from V.2; replace its first proof step by specialization of that
supplier. Retain the source-access/proof gap until the Bass–Tate argument
and the required norm-residue/local-global inputs are decomposed.

**Acceptance:** Q gives one Z/2 factor, Q(i) gives zero; the rank counts
real, not all infinite, places. Rational vanishing follows, but integral
vanishing does not hold for a field with a real place.

### RT-AREA-ktheory-2/20 — import the graded product map

**Current state:** the K3 packet already requests T.2:graded-map.

**Edits:** In V.2 replace construction of Milnor-to-Quillen products with
that import; carry T.2:graded-map → V.2 into stage dependencies. V.2
retains the degree-three image, cokernel and indecomposable quotient.

**Acceptance:** its quotient uses the image of the imported map with the
same product/sign convention, not a second locally defined symbol map.

### RT-AREA-ktheory-2/21 — L.1 supplies transfer as well as group orders

**Current state:** V.5 already requests L.1. Preserve its K3 specialization.

**Edits:** Import restriction/transfer formulas and their compatibility
from KTheoryFiniteLocalFields L.1; remove any duplicate general finite-field
proof in V.5. The edge is **L.1 → V.5**. The verifier's prose giving
V.5 → L.1 is a direction slip: following it would reverse the ownership
just stated. V.5 still explains the degree-three consequences.

**Acceptance:** compare actual restriction and norm maps under cyclic-group
identifications; abstract group orders alone do not discharge the finding.

### RT-AREA-ktheory-2/22 — arithmetic K3 examples use N.5 and N.8

**Current state:** both requests are in the K3 packet.

**Edits:** Add N.5, N.8 → V.5 to the campaign graph and retain the
imported torsion/extension data in the example nodes. V.5 owns the Bloch
interpretation, not a second computation of arithmetic K-groups.

**Acceptance:** Q(i)'s free rank-one part has no canonical generator from
an abstract isomorphism; a chosen explicit generator needs its own proof.

### RT-AREA-ktheory-2/23 — regulator equality is owned by its comparisons

**Current state:** V.6 now has transport/comparison nodes. Keep those
distinct from proving the analytic or p-adic regulator formula.

**Edits:** P.2 owns the real dilogarithm comparison with the exact currently
available normalization; D.2 owns the p-adic one. V.6 imports both for its
transported formulas. An earlier V.6 quotient comparison may supply P.2 or
D.2 at node level, but the later transported-regulator nodes must not.
Adding both whole-stage V.6 → P.2 and P.2 → V.6 creates a cycle. Split the
early interface before integration if both directions are needed.

**Acceptance:** do not replace a currently proved rational proportionality
by a fixed scalar which P.2/R.7 have not yet determined. Specify which
comparison map carries each regulator.

### RT-AREA-ktheory-2/24 — real Deligne foundations before comparisons

**Edits:** Create an early part of M.8 for the real Deligne complex, its
hypercohomology, exact sequence, real/conjugation convention, product and
functoriality, with dependencies only on the actual cohomological and
analytic foundations. The existing M.8 comparison applications retain
their R.7, D.2 and arithmetic prerequisites. P.5 and ER.2 import the early
part; P.5 owns the general curve η/current formula and its compatibility
with the universal regulator. A Goncharov regulator complex is a separate
model: retain its construction and prove a comparison, rather than deleting
it because both complexes compute a regulator.

**Acceptance:** at minimum degree two/weight two, product of degree-one
classes, a tame-symbol boundary and conjugation. Exact complexes, shifts,
Tate factors and comparison maps are required before selecting Lean types.
The current unsplit M.8 → R.7 fails the graph check below.

### RT-AREA-ktheory-2/25 — one hyperbolic-volume formula

**Current state:** the Polylogarithms packet requests the geometric
hyperbolic-space input.

**Edits:** GeometricTopology layer 7 supplies hyperbolic geometry; P.2
owns the ideal-tetrahedron/Bloch–Wigner volume identity with orientation.
ArithmeticQuantumTopology QT.5 imports that identity and constructs its
own triangulation/invariant application. Add the corresponding supplier
edges; remove any second proof of the general volume formula in QT.5.

**Acceptance:** permutation/orientation reversal and the five-term move
must agree with P.1's dilogarithm convention.

### RT-AREA-ktheory-2/26 — distinguish Leopoldt's definition and theorems

**Current state:** P.6 has separate statements and a request to
IntegralIwasawaTheory L4; this does not identify a shared early definition.

**Edits:** Let IntegralIwasawaTheory I.2 supply the completed-unit/local
logarithm map and its rank/injectivity formulation. L4 imports that
definition for its abelian theorem; AutomorphicPadicLFunctions L0 and P.6
import it for their applications. Keep the strong Leopoldt statement,
the weaker cyclotomic statement and the proved abelian case distinct.
For a formulation using local principal units, supply the powering or
Teichmüller/pro-p comparison; there is no unqualified canonical map from
every ordinary unit to the principal-unit subgroup.

**Acceptance:** compare the Qp logarithmic formulation with completed units
modulo their specified torsion. P.6 still owns its p-adic regulator tests,
not a duplicate general Leopoldt conjecture.

### RT-AREA-ktheory-2/27 — reserved analytic IDs

**Maintainer-only edit:** In `research/blueprint/reserved-ids.json`, the
canonical owners of `K3BlochGroups:V.3/bloch-wigner-dilogarithm` and
`K3BlochGroups:V.3/bloch-wigner-five-term` must be the corresponding P.1
analytic nodes. Before removing or redirecting old reservations, enumerate
incoming references and update them, or preserve an explicit compatibility
pointer. Do not create a second definition with the old IDs.

The current K3 packet's pointer/comparison nodes are legitimate imports;
do not delete a proof of comparison with P.1 together with the obsolete
ownership reservation. Update PLAN-HABIRO's convention pointers as well.

**Acceptance:** one analytic definition and one five-term theorem, no
dangling references after reservation regeneration.

## Refined trace methods

### RT-AREA-ktheory-2/3 — explicit Devalapurkar prerequisites

**Edits:** RT.4:q-Hodge must name a preceding Devalapurkar comparison
target with three inputs: the image-of-J type E∞ ring j_(p,0), the
Devalapurkar–Raksit identification of THH(Z_p[ζ_p]), and the relative
comparison with its S1 × Z_p× equivariance. Record thesis Notation 6.2.8,
Theorems 6.1.4 and 6.4.1 as source leads, not decomposed proofs.
Wagner 1.6 gives the p > 2 equivalence with the connective cover of
ku^(tC_p). Keep the spherical base and its chosen q-coordinate explicit:
the thesis's q^(1/p)-1 presentation cannot be replaced with q-1 without
the base-change comparison.

Add a separate gap/target for Wagner's p = 2 argument. A restriction note
saying “preserve odd primes” does not plan the comparison or its proof.

**Acceptance:** equivariance, coefficient ring, p-completion and
connective-cover type must match before applying the even filtration.
The present report leaves these deep source decompositions open.

### RT-AREA-ktheory-2/28 — RT.5 imports both RT.4 comparisons

**Edits:** Add RT.4:q-Hodge → RT.5 and
RT.4:Habiro-comparison → RT.5. In RT.5 state that the Meyer–Wagner
Theorem 3.14 computation uses Wagner 4.27 and 5.63, imported from those
owners. Preserve the exact filtration and completion in the source;
RT.4:topological alone does not supply this result.

**Acceptance:** the ku and periodic KU versions use their respective
graded/Bott-periodic interfaces, not one untyped expression.

### RT-AREA-ktheory-2/29 — multiplicative Moore spectra

**Edits:** Request from StableHomotopyKTheory H.6 the multiplicative
Moore-spectrum structures and compatible towers used by Meyer–Wagner
Proposition 2.27, Corollary 2.30 and §3.3. Add H.6 → RT.5. A cofiber
definition of S/m supplies neither multiplication nor coherent transition
maps. Burklund Theorem 1.5 and the relevant exponent bounds are an explicit
source gap until the theorem and tower construction are read and decomposed.

**Acceptance:** distinguish a chosen E1 or E2 structure from an E∞
structure, individual existence from compatibility along a tower, and
odd-prime exponents from the 2-primary case. Do not claim all S/m are E∞
rings, or promote the abstract's examples into an unrestricted theorem.

### RT-AREA-ktheory-2/30 — solid spectra and the even filtration

**Edits:** RT.4:q-Hodge must request a spectral extension of
VStackSheavesAndLisseCategories VS2's solid formalism: light condensed
spectra, solidification/tensor, trace-class maps and nuclear objects.
Mark it as additional work; existing condensed or solid modules do not
supply spectral objects by a change of notation. Then plan Wagner §§2–3's
solid THH and even filtration, base change and comparisons, followed by
§4.4's adelic gluing. Name the Pstrągowski and Hahn–Raksit–Wilson
descent/comparison inputs as source gaps pending decomposition.

For RT.4:Habiro-comparison request the étale E∞-lifting theorem (Higher
Algebra §7.5) from the ring-spectrum foundation: for the specified étale
π0 algebra the lift is unique up to the appropriate contractible choice.
Apply it to O_F[1/Δ] with the source's divisibility assumptions on Δ.

**Acceptance:** distinguish spectrum from module, solid from ordinary
tensor, local p-complete results from their global gluing, and an actual
spherical étale lift from a ring merely named as one.

### RT-AREA-ktheory-2/31 — relative Habiro rings are a supplier

**Edits:** Add HabiroRings HR.6 → RT.4:Habiro-comparison. Import HR.6's
relative-ring construction and its precise Frobenius/gluing hypotheses
before Wagner's Corollary 3.13/5.63 comparison. Do not infer the relative
ring from HR.5's absolute construction.

**Acceptance:** retain the admissible number-field base and all inverted
primes; a comparison for the permitted ring is not a theorem for every
number-field order.

### RT-AREA-ktheory-2/32 — ring spectra require a supplied monoidal theory

**Edits:** The conservative existing-stage route is
H.5:S-delooping → RT.2 and → RT.4:topological, while explicitly naming
the smash-product/E1/E∞ interface they consume. Prefer an early generic
monoidal-spectra split of H.5:spectra once RS-33 is accepted and integrated;
the later K-theory S-delooping comparison should not own general spectra.
`RS-33.result.json` exists but has no review object at this snapshot, so
this report does not assume its proposed split has been accepted.

**Acceptance:** a symmetric monoidal model/category of spectra, coherent
algebra structures and base-change maps are supplied before THH. The
graph check of the conservative route does not prove those interfaces
have been constructed.

### RT-AREA-ktheory-2/33 — genuine TR/TC comparison once

**Edits:** RT.2 owns the genuine/fixed-point TR/TC construction and its
comparison with the chosen modern cyclotomic definition, including R, F,
V and source hypotheses such as bounded-below conditions.
KTheoryFiniteLocalFields L.4 imports it via RT.2 → L.4, retaining the
Hesselholt–Madsen field/DVR computations and their explicit checks.

**Acceptance:** compare maps and towers, not only groups; do not move
Bökstedt periodicity from L.5 as a side effect (rejected finding /34).

### RT-AREA-ktheory-2/35 — remove the unsupported henselian export

**Edits:** Remove the blanket henselian-invariance output from RT.3.
Keep its nilpotent relative comparison and filtered-tower statements with
their actual hypotheses. Route the henselian-pair result to the
Clausen–Mathew–Morrow Part II owner, Theorem 4.36, and let its consumers
import that theorem forward. Do not add the later henselian theorem as a
prerequisite of the early trace construction.

**Acceptance:** a nilpotent extension and a general henselian pair use
different certificates. Neither nilpotent invariance nor a formal inverse
limit justifies the other theorem without continuity inputs.

### RT-AREA-ktheory-2/36 — syntomic complexes from prismatics

**Edits:** Add PrismaticCohomology PR.4 → RT.6 and replace RT.6's implicit
construction of the relevant syntomic/Tate-twist input with this import.
Keep RT.6's trace comparison as its own theorem.

**Acceptance:** truncation range, twists and Frobenius normalization agree
with PR.4; PR.0–PR.3 alone are not the étale comparison theorem.

### RT-AREA-ktheory-2/37 — derived exterior powers and HKR

**Edits:** Add the DerivedDeRham foundations DD.0 and HKR DD.2 suppliers
to RT.1. Import the cotangent/derived-exterior-power and HKR comparison
interfaces rather than rebuilding them inside Hochschild theory.

**Acceptance:** distinguish smooth underived HKR from its derived or
filtered extension, and preserve the characteristic and smoothness
hypotheses of each comparison.

### RT-AREA-ktheory-2/43 — topological Adams operations with correct scope

**Edits:** In RT.4:topological explicitly plan vector-bundle λ operations,
integral Adams operations on K^0/BU, splitting-principle computations,
universal Chern classes and H*(BU). These supply Quillen's topological
calculation and are not supplied by naming Bott periodicity alone.

Refine the proposed wording “operations on KU”: do not assert a unital
integral ring-spectrum endomorphism of periodic KU sending β to kβ for
arbitrary k > 1. Since β is invertible, such a map would make kβ invertible,
forcing k to be a unit in π0(KU) = Z. State the integral unstable operation
first, and separately source the stable multiplicative version after
inverting k (or in the relevant completion where k is a unit). For the
finite-field application, ℓ-complete KU with ℓ different from the
characteristic makes q a unit. This elementary obstruction is an additional
scope check, not a claim that a stable construction has been supplied here.

**Acceptance:** ψ^k on a line bundle, Bott weight, the Adams/Chern
eigenvalue formula, and the negative integral-periodic test at k = 2.

### RT-AREA-ktheory-2/44 — DGAInfinity already supplies chains and Morita

**Edits:** RT.1 imports DGAInfinity layer 8's Hochschild chain construction,
normalization and Morita interface; layer 9 supplies the perfect-module
Hochschild Chern character where the trace comparison needs it. Retain in
RT.1 the faces/degeneracies/cyclic structure, Connes operator, mixed-complex
identities and circle-action packaging not promised by those upstream
layers. The Dennis trace comparison belongs to RT.3.

**Acceptance:** match the differential/sign convention and normalization
map before importing invariance. DGAInfinity layer 9 is not an already
constructed negative-cyclic theory.

### RT-AREA-ktheory-2/46 — relative trace input from algebraic K-theory

**Edits:** Add GeneralAlgebraicKTheory K.2:plus, K.5 and K.7 → RT.3,
at the relevant construction/product nodes. Import the ring K-functor,
relative fibers and product/naturality data; RT.3 owns the Dennis/cyclotomic
trace and its relative comparison, not a new K-theory functor.

**Acceptance:** the fiber uses the same map as the imported ring functor;
the trace respects the product and maps of pairs.

## Scheme K-theory

### RT-AREA-ktheory-2/38 — Nisnevich foundations before descent

**Current state:** the S packet now contains Nisnevich site, distinguished
squares and descent nodes with source gaps. Their presence is not a
completed generic site/descent library.

**Edits:** Use SchemeAndStackFoundations SF.2 as the canonical generic
owner, or the verifier's permitted alternative of an explicitly separated
early S.4 foundation while that owner is unavailable. Move/import the
generic site, distinguished-square and descent criterion there; S.4 retains
the K-theory application. MotivicEtaleKTheory M.5a imports the early site
nodes, not the whole later K-theory descent theorem.

**Acceptance:** include the empty-scheme condition and the hypotheses under
which excision for distinguished squares implies descent. Preserve the
chosen source's noetherian/dimension/quasi-compactness scope; no statement
for all schemes follows merely from naming a cd-structure.

### RT-AREA-ktheory-2/39 — projective and blow-up geometry imports

**Current state:** the S packet has the R09 geometry requests.

**Edits:** Carry R09.1 and R09.7a → S.5, R09.1 → S.7 into the stage
graph and use the corresponding projective/flag-bundle and blow-up
interfaces. Import StableReduction layer 4 where its blow-up geometry is
the supplier. Retain the K-theory projective-bundle/blow-up formulas and
λ-operation computations in S.

**Acceptance:** the geometric model, regular immersion and normal bundle
used in the K-theory theorem have explicit upstream suppliers.

### RT-AREA-ktheory-2/40 — proper coherent pushforward and base change

**Current state:** `S.2/proper-pushforward-coherent` points to SF.2 but
still plans the generic result locally.

**Edits:** Import StableReduction layer 2's proper coherent-cohomology
interface and JacobianC's flat-base-change interface where their actual
scope suffices. Compare their hypotheses with the noetherian/proper scheme
generality S.2 needs. Request an extension from that owner if an available
interface is curve-specific; do not silently strengthen it. S.2 keeps
the induced G-theory pushforward and the perfect-complex variant under
the additional finite-Tor/perfectness hypotheses.

**Acceptance:** flat base change and the projection formula use the actual
derived maps; properness alone does not imply preservation of perfectness.

### RT-AREA-ktheory-2/41 — remove false operation prerequisites

**Edits to the authoritative stage-link source and forwarded links:**

| Delete | Add or retain instead | Reason |
| --- | --- | --- |
| S.6 → MotivicEtaleKTheory M.4 | S.6 → M.6b | motivic-cycle foundations precede the operation comparison |
| S.6 → KTheoryLowDegrees Z.5 | Z.3 → Z.5, with S.2 | rank/determinant for curves does not need the later λ-ring stage |
| S.7 → KTheoryLowDegrees Z.6 | S.2 and S.5 → Z.6 | surface low-degree computation needs the geometric K-theory formulas, not every later operation |

Do not leave a stale copy of the deleted edge in an accepted restructure
forwarding record. Preserve the actual prerequisite of each low-degree
proof after removing its overly broad stage gate.

**Acceptance:** dependency traversal reaches the required localization,
rank/determinant and projective-bundle formulas without passing through
the removed operations stage.

### RT-AREA-ktheory-2/42 — arithmetic localization specializes S.3

**Edits:** Add S.3 → ArithmeticKTheory N.2 (or prove it is already
inherited through the accepted RS-18/N.1 route). Replace N.2's generic
Dedekind localization construction with the S.3 import. N.2 retains
arithmetic finite support, residue-field identifications, extension maps,
and the number-field consequences used in E.3.

**Acceptance:** exactness, the tame-boundary convention and finite support
agree map by map. Two displayed sequences with isomorphic terms are not
enough.

### RT-AREA-ktheory-2/45 — perfect modules already have an upstream owner

**Current state:** `S.1/perfect-module-complex` still locally plans the
general module definition through a narrower P.7 input.

**Edits:** Import DGAInfinity layer 5's arbitrary-base perfect-module
interface, compactness/thick closure and finite semi-free retract
comparison. S.1 retains the affine derived equivalence, sheafwise locally
perfect condition, gluing, and comparison between scheme and module
carriers. These are additional scheme mathematics, not already supplied
by the module theorem.

**Acceptance:** apply to a non-field commutative base; ensure a
field-specific finite-dimensional characterization is not used as the
definition of perfect. Preserve the compact-object and retract maps under
the affine equivalence.

## Graph checks and remaining integration

A read-only breadth-first reachability check used `data/atlas.json` at the
snapshot above. For a candidate u → v it searched for v → ... → u before
adding the edge to an in-memory graph. The following 31 additions were
processed together in the listed order without closing a cycle in that
snapshot (an already present edge is harmless):

```text
K2SymbolsBrauer:T.4 -> EllipticKTheory:E.5
MotivicEtaleKTheory:M.5d -> EllipticKTheory:E.5
ArithmeticKTheory:N.2 -> EllipticKTheory:E.3
ArithmeticKTheory:N.3:ranks -> EllipticKTheory:E.3
EllipticKTheory:E.6 -> EllipticKTheory:E.7
EllipticRegulators:ER.5 -> EllipticRegulators:ER.8
EllipticKTheory:E.6 -> EllipticRegulators:ER.8
K3BlochGroups:V.5 -> HabiroNumberFields:HB.2
ArithmeticKTheory:N.6 -> HabiroNumberFields:HB.1
PadicHodgeRegulators:D.1 -> PadicHodgeRegulators:D.2
K3BlochGroups:V.4 -> PadicHodgeRegulators:D.2
HabiroRings:HR.1 -> HabiroNumberFields:HB.6
K3BlochGroups:V.3 -> HabiroNumberFields:HB.1
KTheoryFiniteLocalFields:L.1 -> K3BlochGroups:V.5
ArithmeticKTheory:N.5 -> K3BlochGroups:V.5
ArithmeticKTheory:N.8 -> K3BlochGroups:V.5
Polylogarithms:P.2 -> K3BlochGroups:V.6
PadicHodgeRegulators:D.2 -> K3BlochGroups:V.6
RefinedTraceMethods:RT.4:q-Hodge -> RefinedTraceMethods:RT.5
RefinedTraceMethods:RT.4:Habiro-comparison -> RefinedTraceMethods:RT.5
StableHomotopyKTheory:H.6 -> RefinedTraceMethods:RT.5
HabiroRings:HR.6 -> RefinedTraceMethods:RT.4:Habiro-comparison
StableHomotopyKTheory:H.5:S-delooping -> RefinedTraceMethods:RT.2
StableHomotopyKTheory:H.5:S-delooping -> RefinedTraceMethods:RT.4:topological
RefinedTraceMethods:RT.2 -> KTheoryFiniteLocalFields:L.4
PrismaticCohomology:PR.4 -> RefinedTraceMethods:RT.6
SchemeKTheoryOperations:S.3 -> ArithmeticKTheory:N.2
SchemeKTheoryOperations:S.6 -> MotivicEtaleKTheory:M.6b
KTheoryLowDegrees:Z.3 -> KTheoryLowDegrees:Z.5
SchemeKTheoryOperations:S.2 -> KTheoryLowDegrees:Z.6
SchemeKTheoryOperations:S.5 -> KTheoryLowDegrees:Z.6
```

Two additional candidate additions were rejected by this same check:
M.8 → R.7 reverses the existing R.7 → M.8; V.6 → P.2 reverses the
P.2 → V.6 edge just added. These are why /18, /23 and /24 require early
interfaces, not indiscriminate stage links. Separately, the accepted
PLAN-HABIRO HB.2 → HB.4 route rules out HB.4 → HB.2 in /2.

This is a **limited snapshot check**, not a claim that every proposed new
split and every pending restructure has passed a global validator. Before
applying the report, incorporate accepted-but-not-yet-generated restructure
links, choose the new early-interface IDs, remove the obsolete edges in
/16 and /41, and run the graph/checker suite on the resulting complete
change. Never infer mathematical sufficiency from graph acyclicity.

## Validation and handoff boundary

Report validation checks all 45 issue-enumerated IDs against their confirmed
verdicts, verifies that the only changed paths are the report and handoff,
and runs `git diff --check`. The source inputs are parsed as JSON. No
packet was edited, so no packet, link or restructure validation result is
claimed for the proposed edits. No Lean file was changed or compiled, and
no Lake project, dependency cache or language server was started.

Before recording these findings as applied, the maintainer must enable the
target paths or perform the specified edits, run the relevant packet and
graph checkers, and independently review the source-dependent additions.
The source/proof gaps called out above remain open. In particular this
report does not certify Harder's full source decomposition, the final
Hutchinson sign, the finite-field unstable comparison, Keune, the
Devalapurkar/Meyer–Wagner inputs, or the new early M.8 split as complete.
