# Euler systems and the cyclotomic main conjecture — handoff

Refs #725. Codex (GPT-6), session `codex-A13z6S`, 19 October 2026.

The target-level planning pass is **complete**. Every stage L0–L4 is
`planned`; none is claimed `closed`. PROTOCOL §0 sends this complete catalogue
to independent review while retaining the three explicit gaps below. This is
not an interrupted checkpoint and makes no implementation claim.

The packet retains all 67 target ids from Claude Code session `cc-fb70e5`'s
source decomposition and adds eight targets. It has 75 nodes: 32 lemmas,
25 theorems, five comparisons, 12 constructions and one definition; 52 API
items, 55 unit tests, 14 planets, 29 source-read baseline references, 12
supplier requests and 19 source issues. Every definition/construction has at
least three discriminating tests. The reader now states every target, its
hypotheses, proof outline, API, tests, sources and direct prerequisites.

## What this pass establishes at planning level

- L0 includes the unsmoothed cyclotomic family, smoothed Stickelberger
  annihilation, the actual idèlic Stickelberger cohomology family and its
  Euler-factor replacement. The last two have coefficients ℤ_p, not ℤ_p(1).
  The unsmoothed indexing extension is unramified **at** p; the
  Stickelberger extension is unramified at the primes dividing b. The
  contradictory draft descriptions are recorded with their locators.
- L1 and L2 specialize the generic derivative descent and local relation.
  Generic Euler-system carriers, rigidity variants and finite/Iwasawa bounds
  are imported by exact EulerSystemsAndKolyvaginSystems node ids. Strict
  subscript and relaxed superscript Selmer conditions are distinguished.
  L2 imports the general Selmer/class-group comparison directly, since L1's
  stricter comparison assumes χ(p)≠1.
- The finite equality uses divisibility for every character and a precise
  circular-unit class-number product requested from IntegralIwasawaTheory L0.
  For ψ(p)=1 it imports the existing L4 Gras target on the field cut out by
  ψ, which is unramified at p. It never applies that theorem directly to a
  ramified original field. L4's all-prime theorem has no dependency on L3's
  equality, so this argument introduces no cycle.
- L3 isolates the actual finite-layer comparison and explains why
  divisibility, followed by equality of total μ and λ and Weierstrass
  preparation, makes each characteristic-ideal quotient a unit. Equality of
  μ and λ alone would not suffice.
- L4 retains the preceding detailed 2-adic Coleman, Chebotarev, induction,
  valuation/logarithm and ray-class targets. It adds a separate odd-prime
  finite comparison, keeps Greither's non-exact character quotients and the
  integral factor 1/2, and states the exceptional ω component with its
  pole-clearing factor. Greither's finite-index convention is explicitly
  |a|_p=p^{v_p(a)}, the reciprocal of the usual absolute value.
- The bundled Gauss-vector construction has tests for each of its carriers
  and maps, including the decomposition-field norm and a nonzero logarithm
  example. Gross Conjecture 1.15 is never used as a theorem.

The eight new ids end in `unsmoothed-cyclotomic-euler-system`,
`stickelberger-annihilator`, `stickelberger-class-family`,
`euler-factor-variant`, `cyclotomic-derivative-classes`,
`cyclotomic-local-relation`, `finite-layer-comparison` and
`relative-class-group-bound-odd`.

## Exact remaining obligations

1. **L3 bounded circular-unit descent.** For the actual norm limit E∞/C∞,
   prove a uniform bound on the finite-layer length error, including the
   general-conductor Sinnott correction. The comparison is stated for a real
   abelian field of degree prime to p, with a common unramified coefficient
   extension for its characters. Class control and index targets are
   imported; the missing circular-unit descent proof is not asserted read.
   Rubin III Corollary 2.8, p. 38, cites Mazur–Wiles §1.6 and Rubin's
   appendix p. 414 for this input. Those cited proofs were not accessed.
2. **L4 odd-p split-prime comparison.** Prove the valuation/logarithm lattice
   and coinvariant error formula for χ(p)=1 needed in Greither Theorem 4.1,
   pp. 482–484. Greither states every-prime results but gives the p=2 proof
   and refers to Mazur–Wiles and Solomon for odd p. The p=2 argument cannot
   be transferred merely by changing its factor 4 to p.
3. **L4 imported exceptional nonvanishing.**
   `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing` is the precise owner.
   Its packet retains the nonzero Gauss-ideal character projection and
   Baker–Brumer comparison gap. Gross §4, pp. 992–994, and Proposition 1.16,
   p. 983, supply the relevant abelian/algebraic-coefficient route;
   Conjecture 1.15 is not an injectivity theorem. Keep the supplier's gap
   visible until its proof is supplied.

These are follow-up obligations after independent review, not an instruction
for another worker to repeat this completed target-level pass. Supplier
packets also retain their own declared limitations, including the
general-conductor circular-unit norm-lattice correction and the dyadic
reflection input to arithmetic μ=0; importing a target does not close its
supplier's proof gap.

## Supplier contracts and ownership

The 12 requests are explicit in the packet: ColemanPowerSeries L1, L3 and L4;
DirichletPadicLFunctions L2 and L3; IntegralIwasawaTheory I.1, L0, L1 and L2;
SelmerIwasawaCohomology L0 and L2; and the existing ClassFieldTheory roadmap's
arithmetic global-existence layer. In particular:

- I.1 must supply the rank-one torsion-free semilocal multiplicative inverse
  limit, not just Γ≅ℤ_p.
- L0 must supply the exact prime-to-p characterwise circular-unit product,
  including its conductor/norm correction; additive unit rank is insufficient.
- Coleman L3 must supply Rubin Appendix D Definition 1.2's actual λ_m and
  Lemma 1.4's Artin compatibility. Its all-prime coefficient-Frobenius
  sequence retains the dyadic sign term.
- The existing Coleman L4 comparison is for the ℚ cyclotomic tower; the
  general abelian χ comparison remains a precise request.

RT-AREA-iwasawa-1/21 is handled by importing
`SelmerIwasawaCohomology:L4/tate-twist-greenberg-selmer` and recording the
direct SIC L4 → this L3 stage link. This roadmap only translates its
characteristic-ideal equality through that dictionary.

RT-AREA-iwasawa-1/36 is handled here by the direct ES.2 → this L0 stage link
and exact generic ES prerequisites. Its Kato-side changes belong to the Kato
job: import ES.2 directly at Kato L2 and ES.4/ES.8 directly at Kato L4, and
remove the cyclotomic-application detours unless a Kato node actually uses a
cyclotomic-unit statement. No Kato deliverable was edited.

Current LocalGaloisGroups and ProfiniteArithmetic suggested files were read;
ClassFieldTheory was checked for the imported reciprocity interfaces. The
current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
already has completed group algebras, their modules and power-series,
product and dyadic coordinates. These are not replanned. The packet's
separate checked baseline remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

## Sources and corrections

The prior worker's audited source ranges and issues E1–E17 are retained,
with source passages removed. This run read Rubin IV §§1–5, pp. 55–68,
IV Example 8.2, p. 78, VI §§1–4, pp. 89–94, IX §1, pp. 133–136,
IX §6, pp. 140–144, III §4, pp. 40–42, and Appendix D Definition 1.2 and
Lemma 1.4, pp. 164–165. It rechecked RJW §2.2.4, Definition 10.16 and
Appendix B.3, and Greither's relevant §§2–4 conventions and comparisons.
It also read Gross's introduction, Propositions 1.11, 1.14, 1.16, 1.19
and Conjecture 1.15, Proposition 3.8 and §4 directly on the scan images.
The preceding worker's comparison of RJW §13.5 with the published text is
credited separately in the packet.

E18 corrects the coefficient representation in Rubin's draft IX Example
6.2, p. 143; E19 corrects the incompatible field descriptions in IX Example
1.1, p. 135, and III §4.1, p. 42. These findings are scoped to the freely
readable author draft. The published monograph was not inspected, and no
published correction is claimed. Every source version has its URL, reading
date and hash in the packet. Gross's bibliographic reference is corrected to
J. Fac. Sci. Univ. Tokyo Sect. IA Math. 28(3) (1981), 979–994.

The cleared-source index was read. No uncleared copy of Lang, Washington,
Solomon or Mazur–Wiles was accessed. No source passage, PDF or private local
path is included in the deliverables.

## Validation and suggested file

- `check_blueprint.py` against the pinned declaration index: **0 errors,
  0 warnings**; five stages planned, zero stages closed.
- The packet's source issues and source versions also pass `check_errata.py`
  when extracted into an `errata-v1` document with this roadmap's file stem.
- The suggested file is 144 lines. It contains two light real-bodied
  definitions over pinned carriers (`chiComponent` and `chiSum`), distribution
  milestones, their directly statable API and six examples. Heavy arithmetic
  definitions and end theorems whose carriers are not at the pins remain
  fully specified reader targets, as the fixed roadmap shape requires.
- `lean-check research/blueprint/suggested/EulerSystemsCyclotomicMainConjecture.lean`
  **compiled successfully** at the pinned build, with only 14 warnings that
  declarations use `sorry`. `check_sorry_data.py` also passes. No background
  compiler or language server remains running.

Independent review should check the mathematical targets and supplier
contracts, especially the finite product argument and the three explicit
obligations above. Nothing in this submission claims the main conjecture
has been formalised.
