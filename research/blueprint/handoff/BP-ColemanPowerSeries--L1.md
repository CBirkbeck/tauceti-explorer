# BP-ColemanPowerSeries--L1 handoff

Issue #6479. Worker: Codex (GPT-6), session `codex-CzJpqR`.
This is a complete planning pass for the residual original-Coleman,
finite-unramified coefficient-Frobenius variant of `ColemanPowerSeries:L1`.
The accepted parent packet is unchanged. Independent review is required.

## Deliverables and coverage

- Packet: [ColemanPowerSeries--L1.json](../packets/ColemanPowerSeries--L1.json).
- Reader: [ColemanPowerSeries--L1.md](../readmes/ColemanPowerSeries--L1.md).
- Prototype: [ColemanPowerSeries--L1.lean](../suggested/ColemanPowerSeries--L1.lean).

The packet has 40 nodes: eight constructions, one definition, 24 lemmas,
two theorems and five comparisons. It has 35 API entries, 27 unit tests,
six planets, 22 confirmed baseline declarations, zero gaps and four open
supplier requests. All implementation statuses remain unchecked. This is
mathematical planning and signature elaboration, not formalisation.

The sole coverage record is **planned**, not closed: every residual L1 target
is decomposed at lemma level, but supplier interfaces and assembly remain.
There is no second L1 target inventory to discover. Resume at the four
requests and then the parent/part assembly, rather than re-planning the norm
or the arithmetic tower.

## Mathematical conventions and proof closure

The coefficient ring O is the native integer ring of a finite unramified
E/ℚ_p, with p prime and maximal ideal pO. The coefficient topology is p-adic
on each coefficient. Φ fixes coefficients and substitutes (1+T)^p−1.
Its scalar algebra has rank p with basis (1+T)^i, i<p. The native determinant
norm and integral linear trace are **base-valued**, with τ=pψ_O, rather than
an embedded norm or a trace requiring inverse substitution.

σ is arithmetic **p-Frobenius**, rather than the residue-field-size power;
Σ applies σ coefficientwise. Nf≡Σf modulo p. Corrected iteration is
M=Σ⁻¹N. The projector is the coefficientwise limit of M^r and retracts onto
the native subgroup Nf=Σf. Raw norm iteration can cycle on Teichmüller
constants over an unramified coefficient field. Interpolation holds for every
prime. The determinant sign s=(−1)^(p−1) is retained: N(Y)=sY, and the
compatible root tower sζ_n corresponds to sY. At p=2 these are −ζ_n and −Y;
only the positive-root convention requires odd p.

ζ_n has order p^(n+1), including the nontrivial level-zero root. The local
fields are native intermediate-field adjunctions and their integer rings
are integral closures. σ_n extends σ and fixes the roots. The arithmetic
tower U∞ is the subgroup of the actual product of finite-level unit groups
cut out by native relative norms. Twisted evaluation has coordinate
σ_n^(−n)ε_n(f); Coleman interpolation has ε_n(Colσ(u))=σ_n^n(u_n).

The existence proof is explicit. Lift σ_(2r)^(2r)u_(2r) to a polynomial unit
g_r and put v_r=M^r g_r. For n≤r, M^(2r−n)g_r interpolates exactly, so the
uniform iteration estimate makes v_r interpolate modulo p^(r+1).
The same estimate makes M(v_r)−v_r small. Compactness of native series units,
continuous evaluations and vanishing p-power errors give a fixed interpolant.
Complete-DVR Weierstrass factorization and increasing minimal-polynomial
degrees give uniqueness. Compact-to-Hausdorff inversion gives continuity of
the inverse. The argument does not assume the norm square, interpolation
existence, or a fixed lift as a supplier hypothesis.

## Supplier requests and ownership

1. **LocalFieldsRamification layer 0:** native coefficient integer rings,
   finite-extension topologies, compactness, finite freeness over ℤ_p,
   completeness and closed p-power ideals. This is existing upstream scope.
2. **LocalFieldsRamification layer 2:** canonical arithmetic Frobenius,
   residue p-power action and continuity. Current Tau Ceti has relevant
   declarations beyond the pin; the packet cites the owning roadmap rather
   than claiming those declarations at the old baseline.
3. **ColemanPowerSeries:L0:** the finite-unramified specialization of its
   existing cyclotomic arithmetic: actual fields and integral closures,
   inclusions, compatible roots, degree p^n(p−1), relative rank-p power
   bases, continuous evaluation, polynomial unit lifts, σ_n fixing roots
   and commuting with norms, and integral-to-field norm/trace comparison.
   This is arithmetic coefficient extension, distinct from the parent's
   abstract finite-flat tensor quotient in L3–L4. The precise statement and
   consumers are in the packet request.
4. **PadicMeasuresIwasawaAlgebras:L2:** the independent coefficient-extended
   bounded ψ operator, continuous and O-linear, with its polynomial action.
   Begin from that packet's integral coefficient extension and Amice nodes;
   discharge the finite-extension receiving topology/lattice adapter.
   The trace identity is the L1 conclusion, not an input.

The complete-DVR factorization is imported directly from
`PadicMeasuresIwasawaAlgebras:L4/nonzero-power-series-factorization`.
The existing parent ℤ_p coordinate injection and surjection are genuinely
used componentwise in a finite ℤ_p-basis of O. Other parent special-case
lemmas are identified as proof models, not assumed to be O-valued theorems.
The final comparison recovers the parent scalar algebra, norm, trace,
fixed subgroup, norm limit and interpolation under canonical identifications.
No mathematics was moved from a higher tier, and no upstream roadmap edit
or new carrier owner is proposed.

The Suggested file binds native intermediate fields, integer subalgebras,
evaluation maps and the tower subgroup with exact equalities to adjunctions,
integral closures, native convergent evaluation and native norm equalizers.
These typed supplier parameters reduce repeated field-expression elaboration;
they are not abstract replacement fields or unconstrained propositions.
It keeps the Φ module explicit for bases, coordinates, norm and trace.
Translated roots use native HasEval in the receiving integral series ring,
with compatible uniform-derived topology, rather than formal zero-constant
substitution. No field receives an artificial linear topology.

Assembly must reconcile the parent and this part into one L1 reader and
Suggested file, and choose at most six planets for the whole layer. It must
not concatenate their planet lists into twelve. The original general
Lubin–Tate and Laurent-series assertions are outside this integral cyclotomic
unit specialization.

## Sources and baseline read

Mathlib baseline: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Tau Ceti baseline: `f790474821cf4256814db967cb154e7af3d0c369`.
The packet records the 22 declarations and modules whose statements and
ambient hypotheses were read at these pins.

Current TauCetiRoadmap main and the current Tau Ceti library were also
searched, including the roadmaps added since the atlas snapshot. The full
LocalFieldsRamification and ArithmeticDirichletSeries readers and relevant
Suggested declarations were read for ownership, native interfaces and
upstream density. Their existing scope is imported rather than re-planned.

Sources read on 10 October 2026:

- Coleman, *Division Values in Local Fields*, Inventiones Mathematicae 53
  (1979), 91–116, original published scan: Theorem A p.92, Lemma 2a
  pp.94–95, Theorem 11 and Corollary 12 p.102, Lemma 13 and corrected-limit
  equations p.103, Proposition 14 p.104, Theorems 15–16 and Corollary 17
  pp.104–106. Public scan URLs and a separately identified manifest hash
  are in the packet.
- Sharifi, *Iwasawa Theory*, author's public PDF, §5.4, Notation 5.4.1
  through Corollary 5.4.13, printed pp.143–147. SHA-256:
  `99b3a36201cecf55045da6913d462cacdb8dff83bff5860c5883ab7ea824bd32`.

Three version-scoped source issues require independent confirmation: the
interpolation-root index in Sharifi Theorem 5.4.9 (p.145), the omitted
identity root in the product in Proposition 5.4.6's proof (p.144), and the
omitted coefficient Frobenius in the final substitution of that proof
(p.145). The stated norm congruence already has the correct coefficient
Frobenius. The packet gives authored descriptions, corrected formulas,
counterchecks and the public places searched for existing corrections.
No passage of either source was copied into the deliverables. No required
source is missing or inaccessible, and no private library source was used.

## Validation

The packet validator reports zero errors and zero warnings. All 40 node
names, 35 API entries and 27 test comments/examples agree with the reader
and prototype. The intake path/content checker reports four deliverables and
zero problems.

The exact submitted Suggested file elaborated successfully with `lean-check`
at the recorded Mathlib and Tau Ceti pins, using Lean 4.34.0-rc2. It returned
exit code zero, with 98 declaration warnings, all for `sorry`, and no other
warnings or errors. A separate Lean environment audit checked all 91
declarations in its namespace: none of their types contains a placeholder
or unresolved metavariable. Placeholder bodies are intentional roadmap
signatures; no proof implementation is claimed.
