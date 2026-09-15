# Roadmap: relative Fargues–Fontaine curves and period geometry

Extend the absolute curve already specified by upstream AdicSpaces and
[FarguesFontaineDiamonds](../FarguesFontaineDiamonds/README.md) to arbitrary perfectoid
bases over F_q and every nonarchimedean local coefficient field E with residue F_q. Both
equal and mixed characteristic belong to the construction. This is a Part II of that
absolute endpoint, using its period-ring and quotient interfaces through comparison maps.

Dependencies: upstream AdicSpaces and LocalFieldsRamification;
[AdicSpacesPartII](../AdicSpacesPartII/README.md), [PerfectoidSpaces](../PerfectoidSpaces/README.md),
[PerfectoidQuotients](../PerfectoidQuotients/README.md),
[DiamondsAndVStacks](../DiamondsAndVStacks/README.md), FarguesFontaineDiamonds F0–F4.
Use the [shared conventions](../../campaign-guide/DIAMONDS_CONVENTIONS.md). Coefficient sheaves and
classification of bundles are subsequent consumers, not assumptions on the curve.

## RF0. Ramified Witt coefficients and relative period annuli

For a perfect F_q-algebra R construct W_OE(R), its Teichmüller representatives, Frobenius
and the pi-adically complete flat O_E universal property. In mixed characteristic compare
with the completed scalar extension of p-typical Witt vectors over W(F_q); in equal
characteristic identify it with R[[pi]]. Prove functoriality, reduction, topology and
uniformizer-change comparisons. A general E is not obtained by renaming p in a formula.

<a id="rf0-integral-y"></a>
<a id="stage-RF0:integral-Y"></a>
### RF0:integral-Y — Retain the integral period space

For S = Spa(R,R+) perfectoid in characteristic p, equip W_OE(R+) with the
(pi,[varpi])-adic topology and construct
`𝒴_S = Spa(W_OE(R+)) \ V([varpi])` over Spa(O_E). Its characteristic-p fibre is
retained. Cover it by `|pi|^n ≤ |[varpi]| ≠ 0`, construct the completed rational
chart rings with integral-closure plus rings, and prove FS II.1.1: after the specified
completed extension O_E→O_(E∞), E∞ the completion of E(pi^(1/p^∞)), these charts
are perfectoid and their tilt glues to the perfected open unit disc over S. Derive
sheafiness by the topological direct-summand argument, not by assuming all Witt rings
are Tate. Prove II.1.2's untilt functor `𝒴_S^diamond ≅ S × Spd(O_E)`.
This prefix requires P1–P4, AdicSpacesPartII R0–R3/R5 and A3, not Satake, Bun_G,
bundle classification or scheme decomposition.

<a id="rf0-annuli"></a>
<a id="stage-RF0:annuli"></a>
### RF0:annuli — Pass to the generic period domain

Then construct `Y_S = 𝒴_S \ V(pi)`, the open where pi[varpi] is nonzero, and the
annulus rings with their explicit plus subrings. Prove complete separated sheafiness,
restriction, completed base change and independence of varpi. Relative annuli need not
be noetherian; use sousperfectoid/stably uniform arguments with the exact hypotheses.
The fixed-field Q_p comparison must identify the existing rings, not merely their spectra.

## RF1. Quotient and functoriality in the base

Glue Y_S over perfectoid affinoid covers; establish q-Frobenius action, wandering annuli
and the adic quotient X_S = Y_S/phi^Z. Prove descent, pullback along maps T → S, and
compatibility of all structure sheaves and valuations. There is functoriality in S; do not
infer that the adic X_S has an ordinary structural morphism to S from this statement.
Construct the diamond formulas over Perf_Fq with the chosen coefficient-field embedding,
and compare the Q_p, fixed-field specialization with FarguesFontaineDiamonds F1–F3.

## RF2. Untilts, divisors and local de Rham rings

<a id="rf2-integral-divisors"></a>
<a id="stage-RF2:integral-divisors"></a>
### RF2:integral-divisors — Divisors before removing the special fibre

Construct `Div^d_𝒴=(Spd O_E)^d/Σ_d`, with the quotient understood as a v-sheaf,
and prove FS VI.1.1–VI.1.4: its map into relative degree-d closed Cartier divisors
on 𝒴_S, the geometric degree criterion, affineness of the divisor for affinoid S,
and v-descent for bundles on that divisor and its infinitesimal thickenings. For
ordered legs its equation is the product of the primitive Cartier equations; establish
regularity and closed image also at coincident legs. The unordered divisor ideal is
descended as a line bundle, not by choosing a global generator.

Construct the completed sheaf B_D^+ and B_D=B_D^+[1/I_D], independently of equation
and ordering. Prove inverse-limit completeness, gluing and restriction to the
generic locus Div^d_Y. Construct Div^d_X by Frobenius descent, only asserting affineness
locally on S there. The special fibre at the degree-one characteristic-p divisor
gives ramified Witt coefficients, not B_dR of a characteristic-zero untilt. This is
the supplier of GS0's degeneration; replacing 𝒴 by Y would erase that fibre.

<a id="rf2-untilts"></a>
<a id="stage-RF2:untilts"></a>
### RF2:untilts — Generic divisors and de Rham completions

Construct marked untilts over E, the primitive kernel of theta, and its divisor on Y_S
and X_S. Prove injectivity and closed image of multiplication by a local generator on
appropriate annular neighborhoods, identify the complete quotient, and descend the Cartier
divisor. Define Div^1 using the unramified coefficient base Spd(E-breve)/phi^Z over
Perf_Fq. Keep this moduli object distinct from the diamond of one fixed curve.

Construct completion along a divisor, B_dR^+ and its localization B_dR; show that changing
the generator changes the trivialization but not the completed sheaf. Prove functoriality,
residue map, ideal filtration, graded pieces and base-change conditions. At a geometric
untilt identify the complete discrete valuation ring and its residue field. For d ≥ 0,
construct effective Cartier divisors of degree d, addition, disjoint-divisor loci and the
finite symmetric-power comparison in the source's range, retaining multiplicities.

## RF3. Line bundles and the graded algebra

Define O(1) by Frobenius descent with the chosen pi-normalization; construct O(n), tensor
and dual comparisons, divisor sections and transition functions. Prove the sign conversion
between Frobenius eigenvalue and degree. Form the graded algebra of global sections for
affinoid S and construct Proj and the analytic-to-schematic map of locally ringed spaces.
The ampleness/GAGA theorem belongs to VectorBundlesAndIsocrystals VB2; this stage owns
the graded algebra, map and restriction identifications it uses.

## RF4. Patching and modifications

<a id="rf4-vector-bundles"></a>
<a id="stage-RF4:vector-bundles"></a>
### RF4:vector-bundles — Linear patching

Prove Beauville–Laszlo gluing for finite locally free modules along the Cartier divisors
just constructed: a bundle off D, a bundle on its formal neighborhood, and an isomorphism
on the punctured neighborhood determine a bundle, with a fully faithful and essentially
surjective gluing functor. Prove compatibility with tensor, dual, base change and several
disjoint divisors. For nonnoetherian coefficient rings retain completeness, Cartier and
finite-projectivity hypotheses in the algebraic patching argument.

<a id="rf4-g-torsors"></a>
<a id="stage-RF4:G-torsors"></a>
### RF4:G-torsors — Tannakian transfer

Transfer the preceding gluing to G-torsors via the exact tensor-functor comparison
supplied in BunGAndNewtonStrata BG0. BG0 only imports RF0–RF3 and VB1, not this
return. Prove independence of faithful representation and compatibility with extension
of structure group; only then export the modification interpretation to GS0/BG2.

## Acceptance and sources

Tests: Q_p and E = F_q((pi)); a ramified finite extension of Q_p; a non-field affinoid
perfectoid base; two overlapping rational charts; a marked untilt and a degree-two divisor
with coincident points. Verify the actual Frobenius generator and degree signs, not just
orbit sets. A theorem about field-valued points alone does not establish a relative functor.

Primary source: Fargues–Scholze
II.1, II.2.1–II.2.9, III.3 and VI.1. Analytic/relative proofs use
Kedlaya–Liu §§5–8;
Berkeley lectures, 2020 copy:
§6.3 (sousperfectoid descent), §§11.2–11.3 (integral period space and sections),
§13.5 (curve), §§19.1/19.5, especially 19.5.1 and 19.5.3 (torsors/descent),
§§20.3–20.5 (integral families), and Lecture 22 (relative bundles). RF0–RF4 own every added
period-algebra and patching prerequisite; no full p-adic Hodge comparison is assumed.

## Completion contracts added on 2026-09-15

**Applies to:** `RF0:integral-Y`, `RF0:annuli`, `RF2:integral-divisors`, `RF2:untilts`, `RF4:vector-bundles`, `RF4:G-torsors`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Prove the integral period space is sheafy through the specified compatible-root extension and topological direct-summand descent. At coincident legs construct the product Cartier ideal with its multiplicity, complete along that ideal, and verify invariance under permutation and change of local generator. Beauville–Laszlo patching constructs both inverse functors and the comparison on morphisms before the Tannakian transfer to G-torsors.

### Producer–consumer contract

Retain the characteristic-p special fiber for Satake degeneration. The generic-divisor B_dR ring and the ramified Witt ring at the characteristic-p divisor are different specializations. Fixed-field Q_p comparison identifies actual coefficient rings and Frobenius generators.

### Acceptance and source route

A ramified E/Q_p, E=F_q((pi)), a non-field perfectoid base, and a doubled divisor require genuine relative constructions rather than field-point arguments.

**Source route:** FS II.1/VI.1; Berkeley §§19–22; KL15 §§5–8. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
