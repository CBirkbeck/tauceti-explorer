# PKG-ExponentialSumsAndCircleMethod

Package completed for independent review by Codex, session `codex-Cpviju`,
14 October 2026. Refs #9169. The bot confirmed the claim on issue comment
[6161770298](https://github.com/CBirkbeck/tauceti-explorer/issues/9169#issuecomment-6161770298).

## Deliverables and correspondence

The package contains the README, Suggested.lean and one-line metadata.toml
under `research/blueprint/packages/ExponentialSumsAndCircleMethod/`. No packet,
supplier, upstream roadmap, atlas output or generated reader was changed.
The accepted packet, rather than the older 205-target reader, supplies the
206-target inventory, including denominator-dependent major arcs.

The README retains all 206 targets, all 53 definitions, their 242 API
statements and 182 Checks, the exact hypotheses, source locators and worked
acceptance examples. It uses six layers with topic subsections, a summary,
scope, conventions, exact supplier contracts, examples, dependencies and
references. Source statements are expressed in the plan's authored prose;
no source passage, excerpt or section-by-section source summary is included.
Process labels and source-review annotations have been removed from the
reader-facing text without removing their mathematical qualifications.

Suggested.lean was written as a compact statement file: 800 lines, 50 light
definitions with real bodies, 30 milestone/end theorems and 107 examples.
It uses one Mathlib import and one namespace. There is no sorry'd data,
auxiliary development or constructed theory. CRT character equivalence,
cubic h-invariant and the affine restriction invariant remain README
construction targets; they have complete APIs and Checks there. Gaussian,
sharp-box, Birch, line-locus and orbit statements also stay in the README
with their full hypotheses. Nothing is claimed formalised.

## Build order and corrections to carry back to the plan

The original stage order contained several prerequisites on later stages.
The package orders the same targets by their mathematical inputs:

1. Finite oscillation and differencing, including the function-field polar
   count and shrinking.
2. Fourier counting and arcs, including the definition of the Vinogradov
   mean value before the coefficient-count identity.
3. Decoupling and mean values, including Hua, improved Hua and the stronger
   mean-value Weyl estimate after their analytic inputs.
4. Singular series and representation densities.
5. Circle-method representation theorems.
6. Determinant bounds and representation statistics.

In particular, functionFieldPolarCount originally belonged to ES.1 but was
used by ES.0; vinogradovMeanValue belonged to ES.2 but was used by ES.1;
hua_mean_value and vmv_weyl_bound in ES.0 used later ES.2 inputs. All internal
prerequisite edges now stay within a layer or point to an earlier layer.
The packet was left unchanged as the issue requires.

SSTT Corollary 4.10, p.20, cites Heath-Brown 1996 **Corollary 1**, rather than
Corollary 2. The package corrects that secondary locator. The general
fixed-Q endpoint continues to require the full delta-method input.

## Current libraries and ownership

The baseline names and statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. A separate scratch file with all
175 native baseline names elaborated successfully at the pins. Native
totalized integrals, tsum, tprod, limUnder and Nat.card retain their
integrability, convergence and finiteness obligations.

The current upstream screen used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read without running Lake there.
The nine newer roadmaps and the four Completed roadmaps named in WORKERS
were screened, with targeted source reads. OperatorTheory/OrthogonalGeometry
and Completed/EffectiveBounds were read in full as structural models.
This is a bounded ownership screen, not an exhaustive absence assertion.

The package consumes the current Morse charts
`TauCeti.IsNondegenerateCriticalPoint.exists_normal_form` and
`.exists_morse_chart`; it plans only the quantitative cutoff, Jacobian and
stationary-phase transfer. It also consumes
`TauCeti.exists_contDiff_hasCompactSupport_fourier_nonneg` for the portion of
localization that it supplies. A positive Schwartz cutoff with prescribed
small Fourier support of its square root remains an additional target.

IntegralLattices Layer 3 supplies local carriers/forms, odd-prime orthogonal
bases and the local Jordan/dyadic starting interfaces. The packet's maximal
integrality and rank-at-least-five integral hyperbolic-plane splitting,
including p=2, is not supplied by those declarations. The README describes
the exact Part II extension, including the quadratic half-norm convention.
Scalar polynomial solution densities are compared with the overlapping
GeometryOfNumbersAndQuadraticArithmetic Layer 3 densities; group/stabilizer
mass is not substituted for representation density.

The upstream order moves the elementary FF.1 character portion to AN.1 and
the large-sieve/bilinear portion of SV.2 to ST.2. The README records those
transfers. It does not infer the stronger FF.2 character correlation moments
or the exact finite Vaughan coefficient identities from the names of the
moved portions. ExponentialSumsAndCircleMethod is outside the 94-roadmap
Caraiani–Newton order; that order does not assign it a tier. Its own upstream
slot and the supplier extensions below need routing before an upstream PR.

## Proof and supplier boundaries retained

All 26 accepted proof gaps and four supplier requests remain mathematical
obligations, made explicit in the supplier contracts and layer dependency
paragraphs. They are not assumptions bundling the desired conclusion.
Named targets for Gaussian Brascamp–Lieb extremality and transverse
multilinear restriction spell out the external inputs to the decoupling
proof; they implement the accepted proof-input gaps, not additional
representation endpoints.

The following exact ownership assignments still need supplier layer IDs:

| Supplier extension | Required contract and consumer |
| --- | --- |
| FunctionFieldLatticesAndShrinking, Part II | Symmetric gamma shrinking with strict polynomial/fractional balls and adjoint minima; Layer 1 iterated shrinking. |
| Early GeometricCircleMethodAndMappingSpaces | Independent affine intersection dimension, coefficient-uniform polynomial-box counts including D=0, and the Padé/Hankel excluded-kernel equivalence; Layers 1–2. |
| IntegralLattices, Part II | Maximal integral quadratic lattice and integral hyperbolic-plane splitting in rank at least five, including p=2; Layer 4 positivity. |
| ArithmeticDynamics, Part II | Markoff action, congruence classification, geometric density and orbit-growth comparison; Layer 5 class-number application. |

These are the accepted plan's ownership boundaries, not existing proved
exports. Do not invent a stage ID or claim the extension is already present.
For review, start with the README's Exact supplier contracts and compare the
packet's proofGaps, dependencyRequests and upstreamNotes. These assignments
do not require further package prose or Lean construction work; they require
the supplier's own planning/routing before proof closure or upstream intake.

The general quadratic stabilization target explicitly extends SSTT Lemmas
4.4–4.5: their maximality/good-prime conditions cannot be dropped. The
Markoff pair tail is valuation-dependent; the averaged repair requires
separating large common discriminant valuations and controlling the other
local factors and all logarithmic losses. The family
`a=2+2^L, b=2+2^(L+1)` remains a negative control against an absolute uniform
two-adic tail. The critical sparse-curve transfer is not deduced from the
older nondegenerate-curve range `p≤4t−2`. Cubic tentacled/fullness claims
remain hypothesis specifications, with no unconditional theorem or axiom.

Fresh source checks covered the cited endpoint statements and surrounding
proof inputs in the public author versions of Bennett–Siksek, Browning–Sawin,
BDG, Bennett–Carbery–Christ–Tao, Bennett–Bez–Flock–Lee, Bourgain–Demeter,
Assing, Ghosh–Sarnak, SSTT, Niedermowwe, Heath-Brown 2002 and the other
public sources listed in the README. Niedermowwe's Gaussian normalization
and Theorems 2.8/3.6 were inspected visually because text extraction is
corrupted. Bennett–Carbery–Tao Theorem 1.16 was additionally checked in the
linked author version, p.6 and its reduction in pp.7–9.

This run did not establish the full external proofs quoted by those papers:
Graham–Ringrose, the original Burgess argument, Lieb's Gaussian extremality,
Heath-Brown 1996's delta method, Blomer–Granville's binary theorem, Gerstein's
integral splitting, Davenport's real shrinking, or Montgomery's
Kusmin–Landau argument. Their exact input/proof targets remain stated rather
than being certified by a secondary quotation. No restricted book was newly
acquired, copied or used.

## Validation and adversarial checks

Final `lean-check research/blueprint/packages/ExponentialSumsAndCircleMethod/Suggested.lean`
completed with exit 0: exactly 137 declaration-uses-sorry warnings and no
other diagnostics. Memory was checked before each compile; the final
preflight had 102 GB available. No build, update, cache download or language
server was started. All compiles finished and none remains running.

`python3 scripts/check_blueprint.py research/blueprint/packets/ExponentialSumsAndCircleMethod.json`
reports zero errors and zero warnings. The sorry-data checker passes.
A mechanical inventory confirms all 206 target names, 53 API/Checks blocks,
242 definition API statements and 182 Checks; all internal dependency layers
are in order, all source anchors resolve and all 80 Lean declaration names
occur in the README. Metadata contains only `topic = "math.NT"`.

Scratch calculations independently checked 37 exact finite controls and
three floating-point phase values. These calculations test conventions;
they are not proofs of the general theorems. The mathematical pass also
checked the following boundary instances:

| Statements/conventions | Instances and consequences |
| --- | --- |
| Completion and correlation phase | Positive/negative one-step shifts give i and -i, zero shift gives 2; DFT inversion retains q^-1. |
| Intervals and finite counts | Empty intervals, N=0, zero variables, and odd half-interval endpoints retain native cardinalities. |
| Characters and conductors | Level one, ambient nonunit masks, principal/empty families, coprime CRT and v2 conductor values 0,2,3 are distinct branches. |
| Arcs | Q=0, negative radius, wrapped 19/20, closed boundary 1/4, and radius-zero centers; 23/40 rejects the fixed-width mutation at denominator two. |
| Polarization | Cubic factor 6; over F5 the zero Laurent coefficient gives 25 pairs and the first nonzero coefficient gives 9. |
| Mean values and extension | Vinogradov values 6 and 20; s=0 and N=0; reversed interval, zero amplitude, and single-interval normalization. |
| Local density normalization | Projection count 5 normalizes to 1; a duplicated equation gives 5; an overdetermined system uses a negative integer exponent. Real boundary tube gives 1/2. |
| Quadratic two-adic blocks | Modulus eight gives 4 exp(i pi/4), modulus two gives zero; a blanket degree-two recurrence fails. |
| Markoff masses | Modulus one mass 1; delta4(3)=0; delta8(1)=3/4, delta8(5)=9/4; pair mass at q=4,a=4,b=3 is 5/4. |
| Prime factors and tuples | Dyadic factors 2/0 for odd/even target, triadic factors 3/4 and 9/8; weighted triple at N=6 is (log 2)^3. |
| Affine fiber predicates | Projection is positive; xy=k has finitely many divisor pairs on an infinite geometric curve for every nonzero k, so xy is neither perfect nor almost perfect. |
| Projective normalization | Primitive sign-normalized points on X0=0 at B=1 number 4; the zero polynomial gives 13; B=0 gives no projective representative. |

Every theorem remains a target statement. The numerical controls, native
name checks and elaboration do not close the recorded proof obligations.
The next step is an independent REV-PKG review; no package implementation
work remains for this worker.
