# Red team: Clausen–Mathew–Morrow, henselian pairs

Job `RT-PAPER-CLAUSEN-MATHEW-MORROW-21`, issue #4264. Codex,
session `codex-rtOQ9t`, 1 October 2026. Complete. The extraction and its
review were written by different Claude Code sessions; neither is my work.

There are four findings: one high and three medium. The substantial problem
in a copied theorem is the degree of the denominator in the logarithmic
Hodge–Witt description of the trace complement. There is also a library
reuse omission and three unrecorded source slips, grouped into two findings.
The main theorems retain their required hypotheses.

## Texts and scope

I read the complete [arXiv v2 paper](https://arxiv.org/pdf/1803.10897v2)
through its 4,016-line TeX source, including proofs and conventions, and its
496-line bibliography. I downloaded the matching 59-page PDF and checked
locators and the delicate displayed formulas. The JSON records both hashes.
Its PDF hash agrees with the accepted extraction's source artifact.

The version-of-record URL identified by
[Crossref](https://api.crossref.org/works/10.1090/jams/961),
`S0894-0347-2021-00961-X/S0894-0347-2021-00961-X.pdf`, and the corresponding
`jams961_AM.pdf` both returned HTTP 403. Therefore the source findings below
concern **arXiv v2**, without asserting that the JAMS printing retains them.
The [arXiv history](https://arxiv.org/abs/1803.10897) still lists v2 as the
latest version. A title/errata search, [Morrow's publication page](https://www.imo.universite-paris-saclay.fr/~matthew.morrow/)
and Crossref's correction relationships yielded no correction. The latter
has an empty relation object and no update-to entry. This is a recorded
search, not a proof that no correction exists elsewhere.

For finding 1 I additionally read the published Corollary 4.2(ii)–(iii) and
Remark 4.3 of [Morrow's logarithmic Hodge–Witt paper](https://www.numdam.org/item/ASENS_2019__52_6_1537_0.pdf),
p.1567, in extracted text and the page image. I did not audit that whole paper.

All 122 extraction items, nine routes and complete briefs, 13 prerequisite
entries, seven source issues, reader report and review files were checked.
The baseline is atlas commit `71d8e8e`, Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The result-file SHA256 is
`89e9fecb60e812c3207d183613ad706dd9cdb94db12916eeb5a4e735c0a4b5b0`.

## 1. Correct the differential degree in items 099 and 121 — high

These items use

\[
W_r\Omega_R^m/dV^{r-1}\Omega_R^m.
\]

Verschiebung preserves differential degree, whereas the differential raises
it. The purported denominator is therefore in degree \(m+1\), not degree
\(m\). The correct target is

\[
W_r\Omega_R^m/dV^{r-1}\Omega_R^{m-1}.
\]

The error comes from the accessed paper: equations (26) and (27), p.55,
and the following proof repeat it. But the same page's preceding formula
for \(r=1\) correctly uses \(\Omega_R^m/d\Omega_R^{m-1}\).
Morrow's cited Corollary 4.2 supplies exactly the corrected denominator,
and his Remark 4.3 explicitly gives the inverse-Cartier specialization.

Correct both items and the dependent construction in the Part II. Record
the source misprint with its version and these two independent checks. Use
\(\Omega^{-1}=0\) for \(m=0\), and retain arbitrary \(\mathbb F_p\)-algebras.
This is a change to the proposed mathematical interface, rather than merely
a source citation correction.

## 2. Split the existing nonunital algebra data from the missing theory — medium

Item 038 groups nonunital algebras, their category, unitization, the
augmented-algebra equivalence, free objects and categorical limits under
one `missing` status. The route does not identify which of these are
already available. At the pinned Mathlib commit:

| Existing data | Declaration and file |
| --- | --- |
| Scalar-compatible nonunital algebra morphisms | `NonUnitalAlgHom`, `Mathlib/Algebra/Algebra/NonUnitalHom.lean:57` |
| \(R\ltimes I\), with the correct multiplication on \(R\times I\) | `Unitization`, `Mathlib/Algebra/Algebra/Unitization.lean:68` |
| Commutative ring on the unitization | `Unitization.instCommRing`, same file, line 557 |
| Augmentation to \(R\) | `Unitization.fstHom`, line 660 |
| Inclusion of the nonunital algebra | `Unitization.inrNonUnitalAlgHom`, line 675 |
| Extension and uniqueness of maps to a unital algebra | `Unitization.lift`, line 766 |

I read these declarations and their hypotheses. The nonunital carrier is
expressed by `NonUnitalCommRing`, `Module`, `IsScalarTower` and
`SMulCommClass`. This matches an associative commutative multiplication
bilinear over the base. The universal property is the actual equivalence
between nonunital algebra maps out of \(I\) and unital algebra maps out of
its unitization. The reviewed `GeneralAlgebraicKTheory:K.5` audit already
calls out this available construction.

Split the item: cite the existing data as library, and keep the category,
augmented-algebra equivalence, free objects and other missing results as
the residual plan. Local and henselian nonunital algebras and their
reflections still need planning. This finding does not claim that the
universal mapping property alone formalizes all of the category theory.

## 3. Definition 5.14 needs a lower-bound qualification — medium

The source, pp.42–43, asserts that nilpotence of every upper-truncated
tower is equivalent to nilpotence of every homotopy-group tower, for a
tower of arbitrary spectra. The converse requires a common lower bound.

Consider

\[
X_i=\bigoplus_{j\ge i}\Sigma^{-j}H\mathbb F_p,\qquad i\ge1,
\]

with the inclusions of tails as transition maps. For each fixed \(j\),
the \((-j)\)-th homotopy group is \(\mathbb F_p\) at levels \(i\le j\)
and zero at later levels. Thus this tower of groups is nilpotent, with
exponent \(j\). Nevertheless \(\tau_{\le0}X_i=X_i\), and for every
\(i,N\) the transition \(X_{i+N}\to X_i\) is nonzero on
\(\pi_{-(i+N)}\). The upper-truncated tower is not nilpotent.

With a common lower bound, any upper truncation has a finite Postnikov
filtration; finite dévissage gives the claimed implication. The relevant
continuity applications have that bound. Item 091 already uses the safe
truncation definition, so retain it and add the qualification to its note
and the continuity Part II's brief. Record the source error and the
counterexample instead of retaining the reader's claim that none was found.

## 4. Record two missing coefficient corrections — medium

The extracted statements of items 096 and 106 are correct. Their source
proofs contain two additional slips absent from `sourceIssues`:

* **Theorem 5.21, p.44.** Its proof writes an integral equality of the two
  \(K^{\mathrm{inv}}\) spectra when invoking Theorem 4.36. What that theorem
  supplies, and what the proof needs, is
  \(K^{\mathrm{inv}}(R)/p\simeq
  K^{\mathrm{inv}}(R\otimes_{H\mathbb Z}H\mathbb Z/p^i)/p\).
  DGM handles the passage through \(\pi_0\).
* **Corollary 5.33, p.49.** The final proof paragraph claims that the
  integral-to-mod-\(p\) surjection is an isomorphism. For
  \(R=\mathbb F_p\), \(I=0\), \(n=0\), it is simply the constant-tower
  map \(\mathbb Z\to\mathbb Z/p\). The Bockstein sequence instead identifies
  \(\{K_n(R/I^s)/p\}_s\) with
  \(\{K_n(R/I^s;\mathbb Z/p)\}_s\), and gives the claimed vanishing of
  the preceding group's pro \(p\)-torsion.

Add two source-issue entries and notes beside these items. Preserve the
theorem statements and their routes. Neither slip invalidates the intended
continuity or pro torsion-freeness theorem.

## Coverage and routes that survived

The current extraction contains one library item, 19 planned items and
102 missing items. Every missing item occurs in exactly one route. The
older report's counts predate the Nikolaus–Scholze correction that made
item 021 an import from RT.2; this numerical drift is not a separate
mathematical finding.

Theorem B retains both finite Krull dimension and \(d\ge1\); its
introduction uses \(\max(d,1)\). Theorem F retains completeness,
noetherianness and F-finiteness modulo \(p\). Ordinary p-adic continuity
retains bounded p-power torsion; derived continuity uses the derived
quotients and a connective \(H\mathbb Z\)-algebra. The pro Geisser–Levine
claims are claims in pro abelian groups. Theorem D splits homotopy groups
naturally and does not assert an arbitrary spectrum-level splitting.

The three positive henselian library citations were verified in pinned
`Mathlib/RingTheory/Henselian.lean`, including the priority-100
`IsAdicComplete.henselianRing` instance. The reviewed audits corroborate
that spectra-level K-theory and TC remain absent. I read the named layer
descriptions and relevant audits; no reviewed audit entry exists under
the CR.4 or DD.0 identifiers at this base, so no positive library conclusion
was inferred for them.

The BMS19 and Clausen–Mathew extractions share
`RefinedTraceMethodsPartIIHenselianPairs`; AMMN's Part II receives §5.2;
and `ArcTopologyAndDescent` receives affine proper base change. The
Nikolaus–Scholze correction has already fixed the owner of trivial
cyclotomic spectra. Clausen–Mathew's current `revise` review rejects its
earlier broad Selmer-consumer ownership and expressly describes the
dependency order: rigidity/finiteness and the independent hypercompletion
prefix, then TC descent, then the later CMM applications, then Selmer
comparison. I did not manufacture a duplicate or a cycle by treating
that rejected proposal as accepted ownership or by identifying whole
roadmaps with their prerequisite prefixes.

The source's seven previously recorded issues were rechecked. Finding 1
and findings 3–4 request four further version-scoped entries. This is an
audit of the extraction under §16, not an attempt to reprove every cited
supplier paper or demand blueprint APIs in the extraction.

## Validation

Only this report and its result JSON are deliverables. Validation uses
`scripts/check_redteam.py`, the intake file checker and `git diff --check`.
No Lean source is requested, and no Lean build or language server was run.
