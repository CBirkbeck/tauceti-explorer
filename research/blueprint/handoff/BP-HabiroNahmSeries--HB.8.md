# Handoff: BP-HabiroNahmSeries--HB.8

Issue: [#6509](https://github.com/CBirkbeck/tauceti-explorer/issues/6509).
Worker: Codex (GPT-6), session `codex-ZdJYz2`, 6 October 2026.
The bot confirmed this session's claim. This submission completes one
target-level planning pass, under PROTOCOL section 0, and stops without taking
another job.

## Deliverables and status

- [Packet](../packets/HabiroNahmSeries--HB.8.json): `status: complete`, scope
  exactly `HabiroNahmSeries:HB.8`, coverage **planned**, not closed.
- [Reader](../readmes/HabiroNahmSeries--HB.8.md): conventions, arbitrary-rank
  proof, construction APIs, tests, source corrections and completion contracts.
- [Suggested Lean](../suggested/HabiroNahmSeries--HB.8.lean): elaborated
  signatures, API items and twelve named test examples.

There are fifteen fresh nodes: nine theorems, three constructions and three
comparisons. They carry fifteen API items, twelve unit tests, six planets,
thirteen checked Mathlib baseline declarations, three explicit gaps and no
cross-roadmap requests. Every implementation status remains `unchecked`.
There is no claim of formalisation or stage closure.

The accepted parent packet and its independent review were read and retained.
All new ids use `HabiroNahmSeries:HB.8/refinement-...`; the parent was not edited.
The reviewed HB.8 library audit, its roadmap targets, touching stage edges,
relevant packet/link entries and reserved ids were checked. No integrated
HabiroNahmSeries decomposition was present. The upstream Arithmetic Dirichlet
Series and Integral Lattices documents supplied the reader/prototype models.

## Proof obligations supplied by this pass

The elementary Theorem 6 chain now works for every symmetric integer matrix,
including negative diagonal and off-diagonal entries:

1. Simultaneous degree induction and signed telescoping prove integral Laurent
   coefficients of all shift quotients. The off-diagonal shifts are retained.
2. The finite cyclotomic orbit quotient is regular before specialization.
   Its logarithm forces support on m-multiples, and the corrected order-m
   difference equation identifies its root specialization with the unique
   deformed Nahm solution.
3. The residue at q=1 defines a unique zero-constant potential. Euler
   derivatives determine every root-of-unity residue, including the complete
   simple-pole bound. A direct derivative calculation identifies the potential
   with the dilogarithmic critical value.
4. Complete proper-divisor residue induction removes every possible
   cyclotomic pole of each plethystic coefficient. Monic division supplies
   integer Laurent coefficients, hence finite support in the Laurent index.

This chain uses the parent's elementary integral plethystic logarithm and
pole-location lemma. It does not use the parent's finite-support theorem as
a prerequisite, or assume full Gaussian identification.

The general-rank uniqueness of congruence solutions is also supplied: work on
the support k+mN^N and induct using a positive coordinate. The recurrence's
nonzero scalar is invertible in Q(q) or K((x)); no inversion of a vanishing
constant coefficient in K[[x]] is asserted. The multivariable restricted
Adams decomposition has a triangular recursion, a normalization L_0=0,
uniqueness and an inclusion-exclusion proof of Z[1/m]((q))-integrality.

## Exact remaining work

Resume at the reader's Gaussian comparison and completion-contract sections,
with the three packet gaps, rather than extending the elementary finite-support
proof further.

**G1: reconcile the corrected local Gaussian normalization globally.** The
four coefficients removed in (114) disagree with the Pochhammer expansion.
This pass gives the correct local logarithmic remainder and its augmentation
completion. Recompute (118), including every determinant, square-root and
cyclotomic prefactor, with that remainder. Prove periodicity, the Kummer shift
and the affine first-order identity for the fully normalized refined integrals.
The actual affine and recentering rules in GSW Lemmas 3.1–3.2 and block Fubini
in Århus Proposition 2.13 were read; they are not themselves proofs of this
specialized prefactor identity.

**G2: prove uniform t-regularity after Gaussian contraction and summation.**
Use the entrywise covariance formula
Lambda^{-1}=-(I+DA)^{-1}D, with d_j=(1-z_j)/z_j. A determinant estimate alone
does not bound every vertex pole. Even A=0 has an uncontracted no-leg
h Li_0(1-t)/12 term with a t^{-1} pole. Establish the cancellations and
separate coordinate bounds at every loop order, then justify changing from
the x-first completion to K((x))[[t]] and prove constant coefficient one.
The full Gaussian identification and congruence residue statement inherit
G1 and G2. Their theorem specifications are conditional obligations.

**G3: finish corrected level-m admissibility in arbitrary rank.** Preserve the
leading q^{k_j} in the ratio induction. Its linearized denominator is the
product over s other than k_j of 1-q^{k_j+mn_j-s}. Prove denominator bounds
and stability under coprime Adams pullbacks in the corrected localization
R_m. Then carry out the complete proper-divisor cancellation at orders c=ma
with gcd(a,m)=1, including conjugate primitive m-th root values, and prove
L_n(zeta_m) belongs to Z[1/m]. This is additional to the decomposition
construction proved in this pass. Orders such as c=4,m=2 lie outside the
current refined comparison and their Phi_4 poles must remain permitted.

No dependency request or Part II proposal is needed: the parent supplies the
Nahm, Pochhammer, admissibility and Gaussian objects; HB.4 owns the generic
Gaussian operator; Polylogarithms:P.1 owns the polylogarithms; generic products
are already supplied by Mathlib and the parent/QM.0 boundary.

## Source reading and the new finding

The packet records public URLs, version identifiers, access dates and hashes.
Read passages were:

- GSWZ, *The Habiro ring of a number field*, arXiv:2412.04241v2, §§1.6–1.7
  and 2.1–2.7, especially Lemma 2.6 and Theorems 6–8. The PDF and TeX of v2
  were inspected, including the rendered PDF page 29.
- Kontsevich–Soibelman, arXiv:1006.2706v2, Definition 19, Theorem 9 and §6.9,
  including Proposition 13's passage from nonnegative to arbitrary integer
  quadratic twists.
- Efimov, arXiv:1103.2736v2, introduction and Theorem 1.1. Its symmetric
  quiver has nonnegative arrow counts, so it alone does not cover signed A.
- Garoufalidis–Storzer–Wheeler, arXiv:2305.14884v2, §§3.1–3.2, Lemmas 3.1–3.3.
- Århus integral II, arXiv:math/9801049v4, §§2.1–2.2 and Proposition 2.13.

No required cited source remains unread. Missing mathematical inputs are G1–G3.
The parent's source findings E28–E35 and E38–E40 are referenced rather than
duplicated. `HabiroNahmSeries/EHB8-1` is a new finding against (114) in the
exact preprint version, **awaiting independent confirmation**. It concerns
the linear/quadratic coefficients, constant subtraction sign and claimed
completion. At m=1,k=0, two residual coefficients already contradict the
stated four-term removal. Searches of arXiv's version history, author/MPIM
records and the title with errata/corrigendum found no published correction.
No journal version was listed. This finding does not establish that the full
Gaussian theorem is false, and no message was sent to its authors.

## Validation and its limits

The packet checker passed with **zero errors and zero warnings**, using the
shared pinned declaration index. Every cited declaration's statement was
also read in the source tree at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. The Tau Ceti audit and full source
search used the Git object at
`f790474821cf4256814db967cb154e7af3d0c369`, including negative searches for
Nahm, plethystic, Donaldson–Thomas and formal Gaussian declarations. Analytic
probability Gaussians and computable cyclotomics were excluded as near misses.

`lean-check research/blueprint/suggested/HabiroNahmSeries--HB.8.lean` exited
successfully at the pinned Mathlib, with only `sorry` warnings. This file uses
individual Mathlib modules; it needs no Tau Ceti import. Nine new target
declarations have typed prototypes. The six Gaussian/level-m names needing
unresolved completions or corrected coefficient-ring interfaces are explicit
comments specifying what prevents their signatures, as permitted by PROTOCOL
section 13. They were not replaced by proposition-valued placeholders. The
parent adapters and rational restricted-coefficient family are data-valued
prototypes; the full completed-coefficient integrality interface is described
in the packet and reader. Elaboration is not a proof of any theorem.

Independent exact rational-function calculations checked all coefficients
through total t-degree four for A=(0),(1),(3),(-1), [[2,1],[1,1]] and
[[-1,2],[2,-2]]. They checked forward and inverse quotient Laurentness,
ordinary plethystic Laurentness, orbit support and the Nahm equations for
m=1,2,3, and every logarithmic residue for those orders. To reproduce, truncate
the displayed F_A sum at degree four, form its inverse and logarithm by finite
convolution, and reduce root evaluations modulo Phi_m. For a coefficient H_n,
the simple-pole residue is (Phi_m H_n)/Phi_m' reduced modulo Phi_m; compare
it with q V_{n/m}/m^2 when m divides n and zero otherwise. The same exact
calculations verified L_(1,1)=-q^3 for the mixed matrix, the wrong-sign
L_2=q^2/(1+q), and the level-two Phi_4 counterexample displayed in the reader.
These finite checks test the conventions and small cases; the arbitrary-rank
argument and G1–G3 still require independent review. No scratch file is needed
to resume, and no background compiler or language server remains running.
