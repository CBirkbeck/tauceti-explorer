# Independent review: PAPER-ABE-25

**Verdict: revise.** The six corrected ownership routes are accepted. The
extraction remains **partial** because twelve named supplier obligations are
open or unavailable. The review itself is complete.

Reviewer: Codex, session **codex-hjdg0j**; issue
[#1215](https://github.com/CBirkbeck/tauceti-explorer/issues/1215).
Review base: `1257055031e7e3986a570678007c60514c8b5b40`.
The recorded extraction authors are codex-a71f92, codex-c83e7a and cc-442dc5;
the reviewer did not write the input. The bot confirmed the claim before work.

## Scope and method

I read all 18 pages of the
[published paper](https://link.springer.com/content/pdf/10.1007/s00222-025-01345-w.pdf),
including proofs, footnotes and references. I checked all 107 incoming items,
their dependencies, all 37 definition/construction API and use lists, and their
111 planning tests. The review adds three supplier items, for 110 total. No
planning test is reported as an executed Lean test.

The source hashes and precise external-reading limits are recorded under
`independentVerification` in the result. This includes selected Lu–Zheng,
Laumon and Saito passages, both Saito corrections, and selected arXiv v2 pages.
I inspected the published images of pp. 613 and 621. No full arXiv version diff,
complete recursive reading of every reference, or proof formalization is claimed.

I read the full upstream CharacterTheory and GrothendieckEulerForms roadmaps,
the full arithmetic-Galois roadmap, the relevant geometric scope statements and
stage descriptions, and their reviewed library coverage. Thirteen Lean files
were read at the stated declarations and byte-compared with the two pinned
GitHub commits. Searches of both pinned trees found no matching implementation
of Swan/Artin characters, nearby/vanishing cycles, local acyclicity or relative
Lefschetz–Verdier theory. These are bounded searches, not a proof of absence.

## Main mathematical audit

The main result concerns a regular local ring containing a finite field, with
finite Noetherian invariant extension, finite nonidentity fixed lengths and
unchanged residue field. It proves actual positivity and Qℓ realization. A
Qℓ-valued virtual class would not suffice. The trace identity is for σ≠1;
regular-character ambiguity prevents using it alone at the identity. Kato–Saito–
Saito's reduction remains the decisive unread supplier of that last step.

The proof has two independent branches. The ULA-extension theorem supplies a
complex with one chosen endomorphism, which relative categorical traces use to
compare parameter fibres. The local Fourier branch proves support at the
isolated point and identifies its class with negative total dimension. The
support proof does not invoke the trace formula, so its earlier use creates no
cycle. The total-dimension construction uses Swan plus regular; Laumon's Artin
realization instead starts from the augmentation ideal. The extraction keeps
these inputs distinct.

Theorem 1.5 allows finitely presented f over a coherent base with finitely many
irreducible components; f need not be proper. The endomorphism extension does
not establish a coherent action of the whole group. The algebraic trace
argument uses complexes perfect over Λ, while the right tensor factor of the
Fourier comparison must be perfect over Λ[Δ]. Both distinctions survive review.

### Three checked repairs and proof boundaries

**Fixed length.** In A21, ind-étale base change with the selected closed fibre k
is flat and has m_B B′=m_B′. Tensor a composition series of B/Iσ; each simple
factor becomes k, so the length is unchanged. Flatness and equality of residue
fields alone would not force the closed fibre to be a field. The correction
records the needed stronger property. See
[Stacks 59.32.8](https://stacks.math.columbia.edu/tag/03QD).
The spreading and strict-local geometric suppliers of A20 remain open.

**Finite curve cover.** Choose an integral component of the proper alteration
that dominates P¹. Its finite generic field extension makes it a curve. Every
closed fibre is a proper closed subset of that integral curve, hence
zero-dimensional and finite. The map is quasi-finite and proper, hence finite.
Pullback preserves the ULA complex and chosen endomorphism. Thus A24 does not
consume A18's separate finite-cover refinement; this observation does not
prove A18 itself or remove G-GABBER from the extracted remark.

**Integral Swan exactness.** B17–B20's finite inverse-system argument is sound
conditional on the chosen projective Swan tower. Coefficient reduction has
surjective transition maps. Lift finitely many generators and their kernels;
Nakayama and finite-fibre inverse limits give finite generation and reduction
comparison, matching [Stacks087W](https://stacks.math.columbia.edu/tag/087W).
For an exact sequence, E_n=(M′∩ℓ^nM)/ℓ^nM′ need not vanish. If ℓ^c kills the
torsion of M″, E_(n+c)→E_n is zero. Apply the finite Swan functor at a common
quotient and use two exact inverse systems to obtain integral exactness.
The proof never assumes termwise injectivity of quotient reduction.
The geometric uniform-Tor/adic-trace comparison is a different open input.

## Corrections to library and prerequisite claims

L02's pinned character definition assumes a field. Its earlier arbitrary
commutative-ring statement exceeded that citation; the result now states the
actual hypotheses. B13 still plans the genuinely additional coefficient-perfect
trace construction.

The different-ideal tower equality already exists as
`mathlib:differentIdeal_eq_differentIdeal_mul_differentIdeal`. New L11 states
its finite, torsion-free, Dedekind/integrally-closed and separability hypotheses.
L12 also imports `tauceti:TauCeti.multiplicity_differentIdeal_tower`, so even the ramification-index coefficient formula is already built. G09 only adds the geometric local-ring instantiation and Artin/Milnor identification.
Its name no longer suggests the tower formula requires tameness.

B21 records the numerical conductor input over k{t} with algebraically closed k.
R01.3 and LocalFieldsRamification provide arithmetic infrastructure, but their
finite-residue local-field hypotheses cannot be silently applied here. The
projective Swan module and Fourier rank/Swan formulas now depend on this
explicit geometric supplier. Its proof remains G-SWAN. C3 uses §2.2's actual
algebraically closed hypothesis; the separate §3.1 passage is not evidence for
an unchecked extension of the main construction.

B17–B18 explicitly retain the finite projective Zℓ-algebra hypothesis. B10's
finite matrix trace reduction uses the algebraic lattice comparison, not A23's
geometric nearby-cycle comparison. This removes an unnecessary dependency.

## Source findings

All six are **confirmed** individually in JSON; no additional source mistake
is asserted by this review.

| Finding | Check and reach |
|---|---|
| E1 | p.621/v2p.14 omits e(q) in the different tower. The characteristic-5 tower x→x²→x⁶ has exponents1,2,5. The corrected sum is1+2·2. The étale-quotient consequence survives. |
| E2 | p.621/v2p.14 omits the degree-one sign for unshifted C. Laumon2.4.2.2 and2.4.3 give a rank-one degree-one transform for the trivial input. Correct class−1, printed+1. A misprint with the intended comparison unchanged; Proposition2.5 already has the right sign. |
| E3 | p.613/v2p.8 replaces a nonreduced fixed scheme by its closed fibre. In characteristic2, z↦z+t² on z²+t²z−t gives k[z]/z⁴ versus k[z]/z². The proof step fails; A21 repairs its numerical conclusion. |
| E4 | p.609/v2p.4 omits the Noetherian coefficient condition of Lu–Zheng2.16. Confirm a citation-scope gap, not a counterexample to a broader theorem. The finite rings in the main proof satisfy it. |
| E5 | p.621/v2p.14: “If fact” should be “In fact”; no mathematical effect. |
| E6 | p.621/v2p.14 gives a dimension-independent−μ. Saito's Milnor formula and CCΛ=(−1)^n[zero-section] yield (−1)^nμ. For uv on a surface with the sign involution, the identity trace is+1. The nonidentity theorem and curve case remain valid. |

The Saito inputs were read at v4pp.45–46, including Theorem4.9's proof and
Lemma4.11. Both pages of the 2019 correction and the author's second correction
were checked: their Radon/Chern-class repairs do not change the constant-sheaf
sign. The full recursive characteristic-cycle proof remains an import.

The publisher page, current arXiv history and title/correction searches yielded
no Abe correction. The arXiv record still lists v2, dated 13 June 2025. The author
homepage could not be read. “New” therefore records bounded negative evidence,
not an exhaustive novelty claim. No author was contacted.

## Ownership decisions

1. **EDC.8 source: accept.** Isolated graph/diagonal intersection and proper
   point-supported trace specialize its ordinary correspondence interface.
2. **LPV.0 source: accept.** Strict-local smoothness and vanishing-triangle
   comparisons fit its existing trait scope.
3. **Equivariant perfect traces: accept.** GrothendieckEulerForms already owns
   K0 and bounded comparisons but excludes perfect categories. Import K.4's
   bounded-projective prefix and EDS tensor; build only the extra equivariant
   coefficient-perfect and group-ring-perfect interfaces.
4. **Relative categorical traces: accept with corrected sharing.** A01–A03
   are the common generic prefix for schemes and the accepted
   VStackSheavesLefschetzVerdierPartII. The latter retains its own geometric
   operations. Yang–Zhao's unreviewed additions use the same RelativeTraces id.
5. **General bases and local Fourier: accept with corrected sharing.** LPV.0
   does not cover the coherent-base alteration theorem. Yang–Zhao uses this
   same continuation id. Its early support/Fourier prefix precedes late Artin
   and characteristic-cycle applications.
6. **Geometric Artin representations: accept after B21.** Extend arithmetic
   conductors to the actual geometric trait, then the projective Swan tower,
   and finally the main theorem through the shared trace/Fourier outputs.
   L11 supplies ideal transitivity. KSS positivity and Qℓ descent stay explicit.

These are ownership approvals; they do not certify completion of the open
supplier proofs or independently review the other papers sharing these ids.
The W(k)[1/p] statement stays a conjecture in `notTheorems`.

## Remaining work and validation

G-KSS is unavailable to this review; the other eleven obligations remain open:
Lu–Zheng coherence/duality, SGA continuity, Orgogozo goodness, EGA spreading,
the separate Abe–Gabber remark, geometric adic comparison, SGA5/Fulton trace,
projective/geometric Swan inputs, equivariant strictification, integral Fourier
comparison, and the concluding Katz/characteristic-cycle suppliers. Calling
these “deferred” did not establish them. Their exact consumers are retained.

The exact diagnostics test 386 tame towers, the two fixed-algebra lengths,
60 reduction-kernel systems containing 1,055 zero-transition elements, and 204
nodal involution points over odd prime fields. They validate the specified
algebraic checks, not étale cohomology or the source theorems.

The paper checker, five-file intake check and structural audit are recorded
with the submission. No Lean file is required or compiled, and no formalized
proof is claimed. Only the five authorized deliverables change.
