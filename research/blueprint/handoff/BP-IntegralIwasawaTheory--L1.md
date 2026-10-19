# BP-IntegralIwasawaTheory--L1: complete

## Run — Claude (claude-r4P7El), 2026-10-19

Claimed on issue #10811 (the bot confirmed this session's claim). Deliverables:

- `packets/IntegralIwasawaTheory--L1.json`
- `readmes/IntegralIwasawaTheory--L1.md`
- `suggested/IntegralIwasawaTheory--L1.lean`
- this note

The packet status is `complete`; all four stages in scope (L1–L4) are `planned`.

### How this part relates to the I.8 packet

The accepted packet `IntegralIwasawaTheory--I.8.json` already planned L1–L4 (26 nodes) and left
remaining items on every stage, plus gap G3. This part is its follow-up. It does not edit that
packet and does not duplicate its nodes: the field `continues` names it, and `inheritedTargets`
maps each of its 26 L1–L4 nodes to the refinement nodes and exact suppliers that discharge its
stage-level contracts. `refinementEdges` lists the 12 prerequisite edges to add to those parent
nodes at assembly. The reader presents all 52 targets of L1–L4 (26 inherited, 26 new), so the
assembly can take L1–L4 from it.

### What is done

26 new nodes: 4 definitions, 11 theorems, 8 comparisons, 3 lemmas; 26 API items, 18 unit tests,
6 planets, 14 baseline declarations read at Mathlib 082e2d3 (no Tau Ceti declaration is cited).
`check_blueprint.py` (with `TAUCETI_BASELINE` set to the swarm baseline index): 0 errors,
0 warnings.

- **L1.** Definition of the Iwasawa modules X (p-ramified) and Y (unramified) in RJW's letters,
  with the dictionary to I.2's and Sharifi's opposite letters and Greither's. RJW's principal
  closures equal I.2's completed units (Teichmüller projection: closing and intersecting with
  principal units commute) and Coleman's real principal towers (level m ↔ F_{m+1}). Limit
  exactness of (13-1) is PadicMeasuresIwasawaAlgebras §5.2. Iwasawa's rank theorem, and
  Greither's §4 class-field statements, including Chevalley's ambiguous class formula
  (Sharifi Theorem 1.3.16).
- **L2.** ℤ_p-extensions and layers (light Lean definition), their ramification theorem, the
  tower invariants μ, λ, ν as a definition, the discharge of PadicMeasuresIwasawaAlgebras' growth
  cutoff and Nakayama hypotheses, coinvariant evaluation with both dual conventions, descent
  of μ = 0 along finite extensions (norm cokernel bound plus the bounded p-rank criterion), and
  the one-prime hypotheses for the real cyclotomic tower with the index shift (placed in L2 so that
  L1's rank theorem does not depend on L3; the stage graph of L0–L4 and I.1–I.10 has no cycle).
- **L3.** Vandiver ⇔
  plus parts vanish through the tower ⇔ Y_∞^+ = 0, separated from regularity by p = 37; one
  normalisation of ζ_p across RJW, Coleman and I.3.
- **L4.** The Leopoldt defect moves to I.2 (RT-AREA-ktheory-2/26): `L4/leopoldt-defect` is
  superseded as a definition and becomes the logarithmic characterisation
  (`L4/abelian-leopoldt-i2-form`). Baker–Brumer for arbitrary algebraic numbers with Iwasawa's
  logarithm. Sinnott's Γ-transform proof (Γ-transform definition, independence results, μ-theorem,
  Kubota–Leopoldt as a Γ-transform, analytic μ = 0 at every p). μ^- = 0 at every p from the
  relative class number formula; Leopoldt's mirror inequality for odd p; the integral-basis and
  sign arrangement for torsion roots; Washington's theorem on the non-p-part.

### Parent gap G3

Resolved except at the dyadic plus part: the analytic and coefficient adapter by Sinnott (all p,
including 2); the dependent-root lattice step by Washington 1978, Proposition 2, p. 92; the
relative-to-full passage for odd p by Sharifi Theorem 4.4.2 and Proposition 3.4.3; finite-extension
descent by `L2/norm-prank-descent`.

### Gaps left (also in the packet)

- **G-L4-DYADIC-MIRROR.** μ^+ ≤ μ^- for p = 2 and k ⊇ μ_4. Oesterlé p. 174 cites Ferrero
  (Amer. J. Math. 102, 1980) and Washington; neither proof was read. SpecialValuesBirchTate's
  request (μ of the dyadic minus part) does not need it and is met.
- **G-L4-W75.** Washington, Math. Ann. 214 (1975): the reduction to the minus part and the case
  p = 2 used by Washington 1978, p. 88. Free on GDZ; not read here.

### Incoming requests answered (`requestResponses`)

ArithmeticKTheory N.7 and ArithmeticKTheoryPartII R19 (Vandiver); DirichletPadicLFunctions L3-2
(generic Baker–Brumer); EulerSystemsCyclotomicMainConjecture L1 and L2 requests (met, except
Rubin's Lemma 1.2 and Greither's exceptional ω control, which are Euler-system arguments and stay
there; Greither's A′(F) ≅ Y/TY holds with A′(F) read as the torsion part of the ray-class limit);
OrdinaryAutomorphicForms R21.5 (Washington's theorem, RT-AREA-langlands-2/32: add the edge
L4 → R21.5); Polylogarithms P.6; RankZeroOneBSD BSD.7; SpecialValuesBirchTate L2 and L4.

### Planets

L1 gains Iwasawa modules X and Y, Iwasawa's rank theorem (4 in total); L2 gains ℤ_p-extension,
Iwasawa invariants μ, λ, ν (5 in total); L3 unchanged (2). L4 already has six I.8 planets: the
packet's `planetProposals` drops Leopoldt defect (now I.2's) and Digit equidistribution (off the
main route) and adds Sinnott's μ-theorem and Washington's ℓ-part theorem, keeping six.

### Source finding

E94 (misprint, Sharifi notes, proof of Proposition 3.4.3, p. 91): it cites "Lemma 2.4.10" for
the result that is Proposition 2.4.10, p. 58. Affects nothing.

### Sources read (2026-10-19; hashes in the packet)

RJW, Essential Number Theory 4 (2025): §7 Theorem 7.1, §13.1–13.4, Appendix A. Sharifi's notes:
Theorem 1.3.16, §1.5, §2.4, §§3.1–3.4, §4.4, §6.1–6.2. Oesterlé, Bourbaki 535, §§1–4 (pp. 170–176,
text layer). Sinnott, Invent. Math. 75 (1984), complete, from GDZ page images. Washington,
Invent. Math. 49 (1978), complete, from GDZ page images. The merged TauCetiRoadmap
PadicMeasuresIwasawaAlgebras README (main 34dcf0e), Layer 4 and §§4.7, 5.2. No source file or
passage is in the repository.

### Lean

`lean-check research/blueprint/suggested/IntegralIwasawaTheory--L1.lean` at Mathlib 082e2d3 and
Tau Ceti f790474: elaborates with 13 `sorry` warnings and no errors. It has real-bodied light
definitions only (`IsZpExtension`, `zpLayerSubgroup`, `zpLayer`, `pRank`, `relClassNumber`), the
layer-degree, monotonicity and finite-extension statements, the Vandiver tower equivalence and
examples (including p = 37). It does not restate the I.8 file's `Vandiver` or L0 carriers.

### Where to resume

A reviewer needs only the four repository files and the accepted I.8 packet. The assembly applies
`refinementEdges`, `supersededNodes` and `planetProposals`. The next source work is the two gaps:
Ferrero 1980 (or another dyadic mirror proof) and Washington 1975.
