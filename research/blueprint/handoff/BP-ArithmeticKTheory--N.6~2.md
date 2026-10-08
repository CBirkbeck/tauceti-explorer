# Handoff — BP-ArithmeticKTheory--N.6~2

Issue #6921. Agent: Codex — `codex-20n7RW`.
Branch: `codex-20n7RW-arithmetic-k-n6`.

This is a completed revision planning pass. The packet is `complete`, its sole
stage `ArithmeticKTheory:N.6` remains `planned`, and every implementation status
remains `unchecked`. The original independent `needs_changes` review and both
source-finding verdicts are preserved unchanged for the next reviewer. This
submission does not award itself acceptance or claim mathematical closure.

## Deliverables and corrections

The [packet](../packets/ArithmeticKTheory--N.6.json),
[reader](../readmes/ArithmeticKTheory--N.6.md) and
[suggested file](../suggested/ArithmeticKTheory--N.6.lean) retain all 28 node IDs:
4 definitions, 2 constructions, 10 theorems, 5 comparisons and 7 applications.
There are 34 API items, 21 mathematical tests, 15 direct baseline declarations,
7 supplier requests, 2 proof gaps and 2 follow-up planets. Together with the
parent's four planets the assembled layer has six. No parent packet, atlas,
queue, supplier packet or implementation file was changed.

The reader now incorporates every mathematical correction in
[REV-ArithmeticKTheory--N.6](../reviews/REV-ArithmeticKTheory--N.6.md):

- The preprint already says cokernel after (8.2). E-N6-2 remains a rejected
  allegation, not an advertised source mistake. E-N6-1 remains confirmed for
  the hashed preprint, with G2 retained.
- The full degree-four local quotient over Q₂ has order 24; its dyadic
  component has order 8. Degree two has full order 2.
- The special-field decomposition characterisation assumes exceptionality,
  odd twist and sufficiently large nontrivial level.
- Dyadic comparisons and hidden-real-class statements invert every prime over
  2. Cyclotomic descent pins S, ramified primes, and T as its full inverse image.
- VI.9.9's statement is book p.522/PDF p.530, with proof on p.523/p.531;
  VI.9.11 begins on p.524/p.532. The degree 8k+4 order is `2^ρ·|H²|`;
  extension data determine structure.
- Moore III.6.2.4 supplies the degree-two uniquely divisible local kernel;
  VI.7.5 leaves the higher divisible-torsion issue open.
- The exact L2 Selmer-data/kernel/functoriality nodes and R02 H¹ finiteness and
  inverse-limit nodes are imports. Generic Tate/homology and cyclic norm inputs
  come from existing ClassFieldTheory Layer 0, with Shapiro already in Mathlib;
  M.2 supplies arithmetic diagrams. Local reciprocity remains Layer 6's work.

Every reader node reproduces the corrected mathematical statement, hypotheses,
proof outline, direct prerequisites, locators, API, tests and acceptance checks.
No source excerpts are present.

## Concrete suggested declarations and omissions

The numerical `evenTwoRank` and number-field `SpecialAtTwo` have actual
signatures. The latter uses Mathlib cyclotomic fields, algebraic closures,
finite completions and valuation decomposition subgroups. Root witnesses may
vary by dyadic place, and both embeddings occur explicitly. Exceptionality is
an explicit local spelling of the parent N.4 predicate, not a new owner.
The decomposition-equivalence conclusion of `specialDyadicDecomposition` is
also typed; its additional homology/ρ₁ conclusion remains omitted at the named
I.1/ClassFieldTheory Layer 0 boundary.

Four constructors have active generic map interfaces: `positiveEvenK`,
`localSymbolFamily`, `symbolWildKernel` and `cohomologicalWildKernel`. They use
actual additive homomorphisms or linear maps, not fabricated K/cohomology
carriers. All 34 API names have active signatures: 10 concrete numerical or
number-field statements and 24 generic map interfaces. These include real
projection, restriction squares, local-transfer sums, Matsumoto factorisation,
torsion detection, universal lifts, strict Selmer quotient compatibility,
identity/composition laws and the compatible-section kernel identity.

The arithmetic change-of-S identification and continuous-cohomology comparison
are not asserted by their generic signatures. Their needed unramified
factorisations, compatible finite coefficients, surjective coefficient
transitions and global/local H¹ finiteness remain supplier conditions.

Twelve packet tests have active examples: four numerical, four special-field,
three real local cohomology calculations on the actual C2 Tate-twist action on
p-adic integers, and one generic degree-four subgroup-constructor example.
The last still needs its actual K₄ instance. The real even-twist example also
retains a nonzero finite-level sign term to distinguish it from the integral
limit. Two additional examples check the existing full-unit finite-field norm
and the distinction between rank and order.

The new per-declaration `suggestedCoverage` register and the suggested file's
omission register identify **21 omitted named arithmetic statements, the
omitted homology conclusion of the decomposition theorem, and nine omitted
packet tests**. Each names the actual missing carrier or map and its supplier.
Comments are not counted as declarations or examples. In particular neither
ZMod 24 nor an arbitrarily chosen zero group substitutes for the actual local
quotient or rational wild kernel. No opaque K-group stand-in, theorem-valued
structure field or unexpressible condition replaced by a proposition is used.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.6.json`
  and the same check with the shared pinned declaration index both passed:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.6.lean` passed
  at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: **56 warnings, all
  declaration-uses-sorry warnings; no errors or other warnings**. Available
  memory before the final compilation was 112 GB. No language server or build
  was started, and no compile remains running.
- The file imports individual Mathlib modules only. Tau Ceti citations were
  separately read at `f790474821cf4256814db967cb154e7af3d0c369`, rather than
  compiled against the shared build's different Tau Ceti revision.
- Reader/packet statement and API parity, all active API names, typed-test and
  omission-name parity, retained node IDs, unchanged independent review and
  source verdicts, deliverable scope and whitespace checks passed.

Elaboration checks the signatures and explicit carrier choices, not the truth
of the unproved examples or omitted arithmetic statements.

## Mathematical work remaining

G1 requires showing that global torsion with zero finite symbols has zero image
in the higher local divisible parts, with real detection, or correcting the
parent's unconditional higher raw-kernel assertion to its symbol version.
Degree-two equality uses Moore's torsion-free kernel; global torsion alone
cannot prove the higher claim.

G2 requires the compatible ideal-class/cyclotomic Frobenius selection actually
needed by preprint Theorems 4.5 and 6.11, or an independently checked localisation
comparison. Over Q(i) no prime ideal has norm 3 modulo 4, disproving Lemma 4.4's
unrestricted formulation. This does not disprove Theorem A. Odd-prime,
even-twist and nonexceptional branches use residue-norm surjectivity instead.

The seven requests remain precisely scoped to M.2, M.7, H.6, I.1, I.2 and
existing ClassFieldTheory Layers 0 and 6. The exact Selmer and R02 nodes are
already imports rather than duplicate requests. After their genuine arithmetic
carriers/maps are supplied, instantiate the generic interfaces and replace the
named omissions, preserving the reader's hypotheses and map conventions.

## Sources and reproducibility

Freshly fetched and read the public combined K-book draft dated 29 August 2013
and all 22 rendered pages of the wild-kernel author preprint dated 23 July
2004 on 8 October 2026. The two hashes match the independent review and are in
the packet. K-book passages supporting the nodes were checked, including
III.6.2.2–6.2.5, V.6.8–6.8.2, VI.2.3–2.3.1, VI.7.1–7.5 and VI.9.6–9.11.
Book pages and PDF pages differ by eight. Preprint locators use its pagination;
its font extraction is unreliable, so rendered pages were used.

The version of record was not collated in this revision. Its earlier publisher
access failure remains dated 6 October in `sourceVersions`; no new publisher
access or new corrigendum search is claimed. E-N6-1 is therefore scoped to the
preprint. E-N6-2's rejected verdict needs no source repair. No restricted library
source was needed. The two upstream style documents read were Multiquadratic
and Completed/IntegralLattices; the stage edges and exact supplier statements
were also checked.

No PDFs, extracted source text, private paths or scratch logs are submitted.
All information needed after scratch cleanup is retained here and in the
packet's source and declaration-coverage records.
