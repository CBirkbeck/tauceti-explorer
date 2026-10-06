# BP-HabiroNumberFields--HB.7 handoff

Agent: Codex — codex-f2eyXf. Issue: #6496. Branch: codex-f2eyXf-habiro-hb7.
This is a **complete target-level planning pass**, not a checkpoint.
Packet status: complete. HabiroNumberFields:HB.7 coverage: planned, not closed.

## Delivered

The four issue deliverables are the HB.7 part packet, reader, standalone suggested
Lean file, and this note. Only these files are changed. The accepted parent
HabiroNumberFields packet is untouched; its thirteen HB.7 node IDs are imported.

The part has 11 new nodes: 1 definition, 6 theorems, 4 constructions;
27 API items; 15 definition/construction unit tests; 11 pinned baseline
declarations; 3 gap categories; 4 supplier requests. It retains all four
parent HB.7 planets and adds none, avoiding duplicate definitions or a
second planet for Theorem 2. All implementation statuses remain unchecked.

The mathematical calculation added here is the first jet of the normalized
Definition 3.9 section. With h=log(1+x/ζ_m) and the branch
q^(m/2)=exp(mh/2), the shifted Bernoulli expansion gives

U = 1 − ζ x/(24 ζ_m(1−ζ)) + O(x²).

The k=0 pole is removed by (207), B₁(1/2)=0, B₂(1/2)=−1/12,
and the factor m cancels. The coefficient is integral for unramified p>3,
m prime to p, and nontrivial roots ζ of order prime to p.
Valid finite Z_p presentations sum these coefficients. This resolves the
parent's finite linear-coefficient gap mathematically, not the analytic
suppliers or higher Frobenius-defect proof.

The global remainder is now expressed as an effective line-descent theorem,
tensor bijectivity, and the conditional Picard character/tensor powers.
The arithmetic remainder is expressed as coefficient pullback, its scalar
extension equivalence, a semilinear changed-degree coefficient Galois action,
and multiplicative section norm with a trace/Frobenius defect comparison.
Neither local freeness nor well-defined multiplication is treated as
global tensor bijectivity. No global freeness theorem is added.

## Verified finding and inherited source issues

**RT-AREA-ktheory-2/15:** handled by direct D.1 prerequisites on the new local
analytic/jet and arithmetic nodes and an explicit D.1 request for Coleman Li₂,
the log branch, and D_p=Li₂+(1/2)log(z)log(1−z). This is the permitted acyclic
direct-consumer fix. The parent already contains a direct D.1 edge from a
previous fix; the continuation preserves and explicitly documents it.
No supplier files or atlas edges were edited.

**HabiroNumberFields/E23:** retained as G-global-descent. The source's
multiplicativity argument does not prove additive closure, effective
projective descent, chart base changes, conservativity, or global tensor
surjectivity/injectivity. The inverse-line test requires an actual finite
sum f_i g_i=1 for every ξ.

**HabiroNumberFields/E24:** corrected integral linear shape is used throughout.
The new jet calculation supplies precisely that shape input for explicit
sections. The p=5 fractional binomial counterexample remains excluded.

**HabiroNumberFields/E26:** the global abelian generator assertion is not used
or promoted to a freeness theorem. These verified issues are referenced in
inheritedSourceIssues rather than duplicated as new errata.

## Exactly what remains

1. **G-global-descent.** Construct a linear transition datum for the rational
Kummer lines and p-completed local lines, identify its equalizer with
Definition 1.4 including additive closure, and prove effective descent,
finite presentation/projectivity, actual base-change identities and
conservativity. A genuine affine cover/cocycle or a proved arithmetic
patching theorem is needed. A set-theoretic adelic intersection and
completion alone are insufficient. Once supplied, follow the local/rational
comparison proof of tensor bijectivity, extract the inverse-line certificate,
and instantiate the Picard character and actual tensor-power coherence.

2. **G-arithmetic-naturality.** Deliver the early M.8 finite-Chern
restriction/corestriction and coherent Kummer torsor comparisons at every
order used, with ε_m=c_m²; deliver D.1/D.4 scalar, coefficient-automorphism,
Frobenius and trace comparisons. Then prove the actual coefficient pullback,
scalar equivalence, semilinear graded Galois action, and norm gluing.
Keep all cyclotomic and local factors; use a common Δ divisible by 6 and
both discriminants. The norm is multiplicative on sections, not additive;
its transferred degree is tr ξ. Check both Frobenius conventions in (13)
and (21), the p/x lattice, and the cross coefficients in series norm.

3. **G-inherited-local-inputs.** D.1/D.3/D.4 are requested stages.
Complete the valid presentation and higher half-shift defect arguments in
the accepted local section chain. The new finite jet needs no Li₂
integrality input, but using the symbols to represent ξ still needs D.3.
No conclusion for p=2,3, ramified excluded primes, or ζ=1 is claimed.

Requests are D.1, D.3, D.4 and **the early finite-Chern interface** of M.8.
The generic K₃ transfer is imported from
GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula.
HabiroRings:HR.6 remains a consumer; it is not used to construct the modules.
No generic determinant-line norm or Picard norm is re-planned here.

## Sources and baseline audit

Read the reviewed HB.7 library audit before planning. It finds the
target-specific rings/modules and p-adic regulator absent. A pinned Tau Ceti
source search for Habiro, Coleman and dilogarithm found no target
implementation; Coleman-name hits are explanatory references about formal
group and multivariate-series evaluation. The Mathlib source statements
used here were read at the pin: PowerSeries map/product/log/exp/substitution,
Module.Invertible.left, Pic.mk/mk_tensor/mapAlgebra, and determinant norm
including its finite-basis restriction and equivariance theorem.

Read the full upstream AdicSpaces and ArithmeticDirichletSeries documents
for scope, export contracts, conventions and test density.

Public mathematical sources read:
- GSWZ arXiv:2412.04241v2, §§1.4–1.5; §2.1 (46)–(60);
  regulator setup and Theorem 9 in §3.1; full §3.2; §3.3 Theorem 2 and
  Proposition 1.5 proofs. Exact PDF SHA-256 is in the packet.
- Garoufalidis author-hosted Habiro PDF: relevant definition/proof text
  compared to v2, including the unchanged problematic shape and tensor proof.
- Wagner author-hosted thesis introduction §1.5 and §2.2 pp.30–32:
  ring equalizer Lemma 2.12 and Corollary 2.13; no effective descent theorem
  for the indexed modules in those passages.
- Bouis–Gazda arXiv:2602.21894v1 introduction pp.1–3:
  Definition 1.1/Theorem A concern weight-one first Chern regulators,
  not this K₃-line descent.

The arXiv listing still has v2 as the latest GSWZ version.
Public title/erratum/tensor-proof searches and Scholze's papers page found
no relevant replacement proof or correction. The erratum linked on that
page belongs to a different paper. No claim to have read an unpublished
descent argument is made.

## Checks and suggested-file limits

Passed:
- python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNumberFields--HB.7.json:
  0 errors, 0 warnings.
- lean-check research/blueprint/suggested/HabiroNumberFields--HB.7.lean:
  exit 0, only declaration-uses-sorry warnings.
- API/test-name cross-check: all 27 API and 15 test names appear in the file,
  as signatures/tests or expressly omitted signatures naming the missing imports.
- Source excerpts at most 300 characters; no private paths or Lean code
  in the packet/reader; whitespace check passed.

Compilation used the shared prebuilt Mathlib at the exact pin, after
checking more than 20 GB memory available. The file imports only individual
Mathlib modules; no Tau Ceti implementation is assumed. No language server,
Lake build/update or cache acquisition was started.

The file gives genuine rational-coefficient signatures, the formal
exponential/product jet steps, conditional Picard-character signatures
parameterized by actual modules and proved unit/tensor equivalences, and
split-series-norm tests. Actual Habiro lines, Coleman functions and K₃
torsors do not exist at the pins: their exact planned API/test names are
expressly omitted with reasons, following PROTOCOL §13. No arbitrary set
or proposition-valued field represents their missing conditions.
Successful elaboration validates those supplied forms, not any source proof
or implementation. The independent review should inspect that distinction,
the half-power branch, and the global-descent/naturality gap boundaries.
